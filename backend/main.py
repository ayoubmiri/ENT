from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from jose import jwt
from cassandra.cluster import Cluster
import os

app = FastAPI()
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

KEYCLOAK_PUBLIC_KEY = os.environ.get("KEYCLOAK_PUBLIC_KEY", "")
KEYCLOAK_ISSUER = os.environ.get("KEYCLOAK_ISSUER", "http://keycloak:8080/realms/mon-realm")
KEYCLOAK_AUDIENCE = os.environ.get("KEYCLOAK_AUDIENCE", "react-client")

def verify_token(token: str = Depends(oauth2_scheme)):
    try:
        payload = jwt.decode(
            token,
            f"-----BEGIN PUBLIC KEY-----\n{KEYCLOAK_PUBLIC_KEY}\n-----END PUBLIC KEY-----",
            algorithms=["RS256"],
            audience=KEYCLOAK_AUDIENCE,
            issuer=KEYCLOAK_ISSUER
        )
        return payload
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")

@app.get("/me")
def read_users_me(user=Depends(verify_token)):
    return {"user": user}

@app.on_event("startup")
def startup_event():
    global cassandra_session
    cluster = Cluster([os.environ.get("CASSANDRA_HOST", "cassandra")])
    cassandra_session = cluster.connect()
    cassandra_session.execute("""
        CREATE KEYSPACE IF NOT EXISTS ent
        WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}
    """)
    cassandra_session.set_keyspace('ent')
    cassandra_session.execute("""
        CREATE TABLE IF NOT EXISTS users (
            id UUID PRIMARY KEY,
            username TEXT,
            email TEXT,
            role TEXT
        )
    """)

@app.get("/users")
def get_users(user=Depends(verify_token)):
    rows = cassandra_session.execute("SELECT id, username, email, role FROM users")
    return [{"id": str(row.id), "username": row.username, "email": row.email, "role": row.role} for row in rows]