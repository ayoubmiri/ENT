import React from "react";
import { Navigate } from "react-router-dom";
import { useKeycloak } from "@react-keycloak/web";

export default function ProtectedRoute({ children, allowedRoles }) {
  const { keycloak } = useKeycloak();
  if (!keycloak.authenticated) {
    return <Navigate to="/" />;
  }
  const roles = keycloak.tokenParsed?.realm_access?.roles || [];
  const isAllowed = allowedRoles.some(role => roles.includes(role));
  return isAllowed ? children : <Navigate to="/unauthorized" />;
}