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
const listBorrowedBooks = document.querySelector('.nav-listBorrow');
const listBorrowedBooksForm = document.querySelector('.viewall-borrowed-books');
const sidebar = document.querySelector('.sidebar');

console.log("Menu JS loaded");

menu.addEventListener('click', HideMenu);

function HideMenu() {
    sidebar.classList.toggle('sidebar-active');
    sidebar.classList.toggle('sidebar-inactive');
    logout.classList.toggle('hidden');
};

addbook.addEventListener('click', () => {
    addbookform.classList.remove('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.add('hidden');
    loanBookForm.classList.add('hidden');
    listBorrowedBooksForm.classList.add('hidden');
    HideMenu();
});

viewall.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.remove('hidden');
    loanBookForm.classList.add('hidden');
    listBorrowedBooksForm.classList.add('hidden');
    HideMenu();
});

removebook.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.remove('hidden');
    viewAllBooks.classList.add('hidden');
    loanBookForm.classList.add('hidden');
    listBorrowedBooksForm.classList.add('hidden');
    HideMenu();
    console.log("Remove book clicked");
});

removebook.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.remove('hidden');
    viewAllBooks.classList.add('hidden');
    loanBookForm.classList.add('hidden');
    listBorrowedBooksForm.classList.add('hidden');
    HideMenu();
});
loanBook.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.add('hidden');
    loanBookForm.classList.remove('hidden');
    listBorrowedBooksForm.classList.add('hidden');
    HideMenu();
});
listBorrowedBooks.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.add('hidden');
    loanBookForm.classList.add('hidden');
    listBorrowedBooksForm.classList.remove('hidden');
    HideMenu();
});

