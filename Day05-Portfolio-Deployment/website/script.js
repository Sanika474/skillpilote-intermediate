
// ==============================
// MOBILE NAVIGATION
// ==============================

const menuBtn = document.getElementById("menuBtn");
const navLinks = document.getElementById("navLinks");

menuBtn.addEventListener("click", function () {
    const isOpen = navLinks.classList.toggle("active");

    menuBtn.setAttribute("aria-expanded", isOpen);
});

// Close navigation after clicking a link
const navigationItems = document.querySelectorAll(".nav-links a");

navigationItems.forEach(function (link) {
    link.addEventListener("click", function () {
        navLinks.classList.remove("active");
        menuBtn.setAttribute("aria-expanded", "false");
    });
});

// ==============================
// DYNAMIC COPYRIGHT YEAR
// ==============================

const yearElement = document.getElementById("year");

yearElement.textContent = new Date().getFullYear();

// ==============================
// CONSOLE MESSAGE
// ==============================

console.log("Welcome to Sanika's Portfolio!");
console.log("Portfolio website loaded successfully.");
