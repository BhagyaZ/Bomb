document.addEventListener('DOMContentLoaded', () => {
    const toggleButtons = document.querySelectorAll('.toggle-btn');

    toggleButtons.forEach(button => {
        button.addEventListener('click', () => {
            const body = button.parentElement.nextElementSibling;
            body.style.display = body.style.display === 'block' ? 'none' : 'block';
            button.textContent = body.style.display === 'block' ? 'Hide Details' : 'View Details';
        });
    });
});
