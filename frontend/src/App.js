import React from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import { useKeycloak } from "@react-keycloak/web";
import AdminPage from "./AdminPage";
import ProfPage from "./ProfPage";
import EtudiantPage from "./EtudiantPage";
import HomePage from "./HomePage";
import Unauthorized from "./Unauthorized";
import ProtectedRoute from "./ProtectedRoute";
import ProfilePage from "./ProfilePage";

function App() {
  const { keycloak } = useKeycloak();
  const roles = keycloak.tokenParsed?.realm_access?.roles || [];

  return (
    <Router>
      <nav style={{ padding: 10, textAlign: "center" }}>
      
        <Link to="/">Accueil</Link>{" | "}
        {roles.includes("admin") && <Link to="/admin">Admin</Link>}{" | "}
        {roles.includes("prof") && <Link to="/prof">Prof</Link>}{" | "}
        {roles.includes("etudiant") && <Link to="/etudiant">Etudiant</Link>}{" | "}
        {keycloak.authenticated && <Link to="/profile">Mon Profil</Link>}{" | "}
        {keycloak.authenticated ? (
          <button onClick={() => keycloak.logout()} style={{ marginLeft: 10 }}>
            Déconnexion
          </button>
        ) : (
          <button onClick={() => keycloak.login()} style={{ marginLeft: 10 }}>
            Connexion
          </button>
        )}
      </nav>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route
          path="/admin"
          element={
            <ProtectedRoute allowedRoles={["admin"]}>
              <AdminPage />
            </ProtectedRoute>
          }
        />
        <Route
            path="/profile"
            element={
              <ProtectedRoute allowedRoles={["admin", "prof", "etudiant"]}>
                <ProfilePage />
              </ProtectedRoute>
            }
        />
        <Route
          path="/prof"
          element={
            <ProtectedRoute allowedRoles={["prof"]}>
              <ProfPage />
            </ProtectedRoute>
          }
        />
        <Route
          path="/etudiant"
          element={
            <ProtectedRoute allowedRoles={["etudiant"]}>
              <EtudiantPage />
            </ProtectedRoute>
          }
        />
        <Route path="/unauthorized" element={<Unauthorized />} />
      </Routes>
    </Router>
  );
}

export default App;