// main.js
// Validate Login Form
document.querySelector('form').addEventListener('submit', (e) => {
    const username = document.querySelector('#username').value.trim();
    const password = document.querySelector('#password').value.trim();

    if (!username || !password) {
        alert('Please fill in all fields.');
        e.preventDefault(); // Stop form submission
    }
});
