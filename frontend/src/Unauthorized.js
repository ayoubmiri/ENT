import React from "react";
import "./Unauthorized.css";

export default function Unauthorized() {
  return (
    <div className="unauthorized-container">
      <h2 className="unauthorized-title">Accès refusé</h2>
      <p>Vous n'avez pas les droits pour accéder à cette page.</p>
    </div>
  );
}