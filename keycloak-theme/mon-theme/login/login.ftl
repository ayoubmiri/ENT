<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion - EST Salé</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Si vous utilisez le CDN Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Variables CSS -->
    <style>
        :root {
            --primary-color: #00b300; /* blue-800 */
            --primary-hover: #1a3764; /* blue-700 */
            --text-on-primary: #ffffff; /* white */
            --bg-color: #f3f4f6; /* bg-gray-100 */
            --button-bg: #1e40af; /* blue-800 */
            --button-hover-bg: #1e3a8a; /* blue-700 */
            --text-color: #4b5563; /* text-gray-700 */
            --input-border-color: #d1d5db; /* gray-300 */
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

    <!-- Header -->
    <header style="background-color: var(--primary-color);" class="text-white py-4">
        <div class="container mx-auto flex justify-between items-center px-4">
            <h1 class="text-2xl font-bold">EST Salé</h1>
            <nav class="space-x-6 hidden md:flex">
                <a href="#" class="hover:underline">Accueil</a>
                <a href="#" class="hover:underline">Inscription</a>
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
    <div id="mobile-menu" class="hidden" style="background-color: var(--primary-color);">
        <nav class="flex flex-col items-center py-4">
            <a href="#" class="hover:underline py-2">Accueil</a>
            <a href="#" class="hover:underline py-2">Inscription</a>
            <a href="#" class="hover:underline py-2">Contact</a>
        </nav>
    </div>

    <!-- Login Form -->
    <main class="flex-grow flex items-center justify-center px-4">
        <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg mt-10 mb-10">
            <h2 class="text-2xl font-bold text-center" style="color: var(--primary-color);">Connexion</h2>
            <form id="kc-form-login" action="${url.loginAction}" method="post" class="space-y-4">
                <#if message?has_content>
                    <div class="text-red-500 text-sm">${message.summary}</div>
                </#if>

                <div>
                    <label for="username" class="block" style="color: var(--text-color);">Nom d'utilisateur ou e-mail</label>
                    <input type="text" id="username" name="username" value="${login.username!''}" required class="w-full px-4 py-2 border rounded-md" style="border-color: var(--input-border-color);">
                </div>

                <div>
                    <label for="password" class="block" style="color: var(--text-color);">Mot de passe</label>
                    <input type="password" id="password" name="password" required class="w-full px-4 py-2 border rounded-md" style="border-color: var(--input-border-color);">
                </div>

                <div class="flex items-center">
                    <input type="checkbox" id="rememberMe" name="rememberMe" class="mr-2">
                    <label for="rememberMe" class="text-sm" style="color: var(--text-color);">Se souvenir de moi</label>
                </div>

                <button type="submit" class="w-full py-2 rounded-md" style="background-color: var(--primary-color); color: var(--text-on-primary); hover:bg-opacity-90;">
                    Se connecter
                </button>
            </form>

            <p class="text-sm text-center mt-4">
                <#if realm.registrationAllowed>
                    <a href="${url.registrationUrl}" class="text-sm text-blue-600 hover:underline">Créer un compte</a>
                </#if>
                <br>
                <a href="${url.loginResetCredentialsUrl}" class="text-blue-600 hover:underline">Mot de passe oublié ?</a>
            </p>
        </div>
    </main>

    <!-- Footer -->
    <footer style="background-color: var(--primary-color);" class="text-white text-center py-4">
        <p class="text-sm">© 2025 EST Salé. Tous droits réservés.</p>
    </footer>

    <!-- Script mobile menu -->
    <script>
        const mobileMenuButton = document.getElementById('mobile-menu-button');
        const mobileMenu = document.getElementById('mobile-menu');
        mobileMenuButton.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });
    </script>
</body>
</html>
