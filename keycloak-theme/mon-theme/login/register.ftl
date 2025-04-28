<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Inscription - EST Salé</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    :root {
      --primary-color: #00b300; /* Bleu principal */
      --secondary-color: #2563EB; /* Bleu secondaire */
      --bg-color: #F3F4F6; /* Couleur de fond */
      --text-color: #374151; /* Texte principal */
      --text-light-color: #6B7280; /* Texte secondaire */
      --button-hover-color: #1E40AF; /* Couleur de survol du bouton */
    }
  </style>
</head>
<body class="bg-[var(--bg-color)]">

  <!-- Header -->
  <header class="bg-[var(--primary-color)] text-white py-4">
    <div class="container mx-auto flex justify-between items-center px-4">
      <h1 class="text-2xl font-bold">EST Salé</h1>
      <nav class="space-x-6 hidden md:flex">
        <a href="#" class="hover:underline">Accueil</a>
        <a href="${url.loginUrl}" class="hover:underline">Connexion</a>
        <a href="#" class="hover:underline">Contact</a>
      </nav>
      <div class="md:hidden flex items-center">
        <button id="mobile-menu-button" class="text-white">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
          </svg>
        </button>
      </div>
    </div>
  </header>

  <!-- Mobile Menu -->
  <div id="mobile-menu" class="hidden bg-[var(--primary-color)] text-white md:hidden">
    <nav class="flex flex-col items-center py-4">
      <a href="#" class="hover:underline py-2">Accueil</a>
      <a href="${url.loginUrl}" class="hover:underline py-2">Connexion</a>
      <a href="#" class="hover:underline py-2">Contact</a>
    </nav>
  </div>

  <!-- Registration Form -->
  <div class="flex items-center justify-center min-h-screen px-4">
    <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg">
      <h2 class="text-2xl font-bold text-center text-[var(--primary-color)] mb-6">Inscription</h2>
      <form id="kc-register-form" action="${url.registrationAction}" method="post" class="space-y-4">
        <#if message?has_content>
          <div class="text-red-500 text-sm">${message.summary}</div>
        </#if>

        <#if !realm.registrationEmailAsUsername>
          <div>
            <label for="username" class="block text-[var(--text-color)]">Nom d'utilisateur</label>
            <input type="text" id="username" name="username" value="${register.formData.username!}" required class="w-full px-4 py-2 border rounded-md">
          </div>
        </#if>

        <div>
          <label for="email" class="block text-[var(--text-color)]">Adresse e-mail</label>
          <input type="email" id="email" name="email" value="${register.formData.email!}" required class="w-full px-4 py-2 border rounded-md">
        </div>

        <div>
          <label for="firstName" class="block text-[var(--text-color)]">Prénom</label>
          <input type="text" id="firstName" name="firstName" value="${register.formData.firstName!}" required class="w-full px-4 py-2 border rounded-md">
        </div>

        <div>
          <label for="lastName" class="block text-[var(--text-color)]">Nom</label>
          <input type="text" id="lastName" name="lastName" value="${register.formData.lastName!}" required class="w-full px-4 py-2 border rounded-md">
        </div>

        <div>
          <label for="password" class="block text-[var(--text-color)]">Mot de passe</label>
          <input type="password" id="password" name="password" required class="w-full px-4 py-2 border rounded-md">
        </div>

        <div>
          <label for="password-confirm" class="block text-[var(--text-color)]">Confirmer le mot de passe</label>
          <input type="password" id="password-confirm" name="password-confirm" required class="w-full px-4 py-2 border rounded-md">
        </div>

        <button type="submit" class="w-full bg-[var(--primary-color)] text-white py-2 rounded-md hover:bg-[var(--button-hover-color)]">S'inscrire</button>
      </form>

      <p class="text-sm text-center mt-4">
        Déjà inscrit ? <a href="${url.loginUrl}" class="text-[var(--secondary-color)] hover:underline">Se connecter</a>
      </p>
    </div>
  </div>

  <!-- Footer -->
  <footer class="bg-[var(--primary-color)] text-white mt-12">
    <div class="container mx-auto px-4 py-6 text-center">
      <p class="text-sm">© 2025 EST Salé. Tous droits réservés.</p>
    </div>
  </footer>

  <script>
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');
    mobileMenuButton.addEventListener('click', () => {
      mobileMenu.classList.toggle('hidden');
    });
  </script>

</body>
</html>
