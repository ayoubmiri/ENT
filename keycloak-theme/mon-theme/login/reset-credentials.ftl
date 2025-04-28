<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Mot de passe oublié - EST Salé</title>

  <!-- Tailwind CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Variables CSS -->
  <style>
    :root {
      --primary-color: #00b300;
      --primary-hover: #1a3764;
      --text-on-primary: #ffffff;
      --bg-color: #f3f4f6;
      --button-bg: #1e40af;
      --button-hover-bg: #1e3a8a;
      --text-color: #4b5563;
      --input-border-color: #d1d5db;
    }
  </style>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

  <!-- Header -->
  <header style="background-color: var(--primary-color);" class="text-white py-4">
    <div class="container mx-auto flex justify-between items-center px-4">
      <h1 class="text-2xl font-bold">EST Salé</h1>
      <nav class="space-x-6 hidden md:flex">
        <a href="accueil.html" class="hover:underline">Accueil</a>
        <a href="${url.loginUrl}" class="hover:underline">Connexion</a>
        <a href="contact.html" class="hover:underline">Contact</a>
      </nav>
    </div>
  </header>

  <!-- Formulaire -->
  <main class="flex-grow flex items-center justify-center px-4">
    <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg mt-10 mb-10">
      <h2 class="text-2xl font-bold text-center mb-6" style="color: var(--primary-color);">Mot de passe oublié ?</h2>
      <p class="text-center text-gray-600 mb-4">Entrez votre adresse e-mail pour recevoir un lien de réinitialisation.</p>

      <form id="kc-reset-password-form" action="${url.loginAction}" method="post" class="space-y-4">
        <div>
          <label for="username" class="block" style="color: var(--text-color);">Adresse e-mail</label>
          <input type="text" id="username" name="username" required autofocus class="w-full px-4 py-2 border rounded-md" style="border-color: var(--input-border-color);">
        </div>
        <button type="submit" class="w-full py-2 rounded-md" style="background-color: var(--primary-color); color: var(--text-on-primary);">
          Envoyer le lien
        </button>
      </form>

      <p class="text-sm text-center mt-4">
        Vous vous souvenez de votre mot de passe ?
        <a href="${url.loginUrl}" class="text-blue-600 hover:underline">Retour à la connexion</a>
      </p>
    </div>
  </main>

  <!-- Footer -->
  <footer style="background-color: var(--primary-color);" class="text-white text-center py-4">
    <p class="text-sm">© 2025 EST Salé. Tous droits réservés.</p>
  </footer>

</body>
</html>
