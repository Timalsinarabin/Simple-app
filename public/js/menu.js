const addbook = document.querySelector('.nav-addbook');
const viewall = document.querySelector('.nav-viewall');
const viewAllBooks = document.querySelector('.viewall-books');
const addbookform = document.querySelector('.add-book-form');
const removebook = document.querySelector('.nav-removebook');
const removebookform = document.querySelector('.remove-book-form');
const menu = document.querySelector('.side-menu');
const title = document.querySelector('.title');
const logout = document.querySelector('.nav-logout');
const loanBook = document.querySelector('.nav-loanBook');
const loanBookForm = document.querySelector('.loan-book-form');
const sections = [removebook, viewall, addbook, title, logout, loanBook];

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
    loanBookForm.classList.add('hidden');
    HideMenu();
});

viewall.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.remove('hidden');
    loanBookForm.classList.add('hidden');
    HideMenu();
});

removebook.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.remove('hidden');
    viewAllBooks.classList.add('hidden');
    loanBookForm.classList.add('hidden');
    HideMenu();
});
loanBook.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.add('hidden');
    loanBookForm.classList.remove('hidden');
    HideMenu();
});