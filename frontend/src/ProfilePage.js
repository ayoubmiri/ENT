import React from "react";
import { useKeycloak } from "@react-keycloak/web";
import "./ProfilePage.css";

export default function ProfilePage() {
  const { keycloak } = useKeycloak();
  const user = keycloak.tokenParsed || {};

  return (
    <div className="profile-container">
      <h2 className="profile-title">Mon Profil</h2>
      <ul className="profile-list">
        <li><strong>Nom d'utilisateur :</strong> {user.preferred_username}</li>
        <li><strong>Email :</strong> {user.email}</li>
        <li><strong>Prénom :</strong> {user.given_name}</li>
        <li><strong>Nom :</strong> {user.family_name}</li>
        <li>
          <strong>Rôles :</strong> {(user.realm_access?.roles || []).join(", ")}
        </li>
      </ul>
    </div>
  );
}