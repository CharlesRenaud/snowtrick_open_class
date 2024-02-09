document.addEventListener('DOMContentLoaded', function () {
    function addImageForm(collectionHolder, prototype, index) {
        const newForm = prototype.replace(/__name__/g, index);
        const newItem = document.createElement('li');
        newItem.innerHTML = newForm;
        collectionHolder.appendChild(newItem);
    }

    document.querySelector('.add_image_link').addEventListener('click', function (e) {
        e.preventDefault();

        const collectionHolder = document.querySelector('.images');
        const prototype = collectionHolder.dataset.prototype;
        const index = collectionHolder.dataset.index++;

        addImageForm(collectionHolder, prototype, index);
    });
});

document.addEventListener('DOMContentLoaded', function () {
    function addImageForm(collectionHolder, prototype, index) {
        const newForm = prototype.replace(/__name__/g, index);
        const newItem = document.createElement('li');
        newItem.innerHTML = newForm;
        collectionHolder.appendChild(newItem);
    }

    document.querySelector('.add_item_link').addEventListener('click', function (e) {
        e.preventDefault();

        const collectionHolder = document.querySelector('.videos');
        const prototype = collectionHolder.dataset.prototype;
        const index = collectionHolder.dataset.index++;

        addImageForm(collectionHolder, prototype, index);
    });
});