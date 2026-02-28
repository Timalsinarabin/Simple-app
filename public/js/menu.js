const addbook = document.querySelector('.nav-addbook');
const viewall = document.querySelector('.nav-viewall');
const viewAllBooks = document.querySelector('.viewall-books');
const addbookform = document.querySelector('.add-book-form');
const removebook = document.querySelector('.nav-removebook');
const removebookform = document.querySelector('.remove-book-form');
const menu = document.querySelector('.side-menu');
const title = document.querySelector('.title');
const logout = document.querySelector('.nav-logout');

const sections = [removebook, viewall, addbook, title, logout]

console.log("Menu JS loaded");

menu.addEventListener('click', HideMenu);

function HideMenu() {
    sections.forEach(section => {
        section.classList.toggle('hidden');
    });
};

addbook.addEventListener('click', () => {
    addbookform.classList.remove('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.add('hidden');
    HideMenu();
});

viewall.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.remove('hidden');
    HideMenu();
});

removebook.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.remove('hidden');
    viewAllBooks.classList.add('hidden');
    HideMenu();
});
