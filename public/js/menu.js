const addbook = document.querySelector('.nav-addbook');
const viewall = document.querySelector('.nav-viewall');
const viewAllBooks = document.querySelector('.viewall-books');
const addbookform = document.querySelector('.add-book-form');
const removebook = document.querySelector('.nav-removebook');
const removebookform = document.querySelector('.remove-book-form');

addbook.addEventListener('click', () => {
    addbookform.classList.remove('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.add('hidden');

    viewall.classList.remove('bg-purple-200');
    addbook.classList.add('bg-purple-200');
});

viewall.addEventListener('click', () => {
    addbookform.classList.add('hidden');
    removebookform.classList.add('hidden');
    viewAllBooks.classList.remove('hidden');

    addbook.classList.remove('bg-purple-200');
    viewall.classList.add('bg-purple-200');
});

removebook.addEventListener('click', () => {
    removebookform.classList.remove('hidden');
    viewAllBooks.classList.add('hidden');

    viewall.classList.remove('bg-purple-200');
    addbook.classList.remove('bg-purple-200');
    removebook.classList.add('bg-purple-200');
});