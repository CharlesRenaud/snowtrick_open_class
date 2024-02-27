function deleteImageRequest(index) {
    index = (index - 1);

    let deleteInput = document.getElementsByClassName("delete_image_input");

    if (index < 0 || index >= deleteInput.length) {
        console.error('Invalid index');
        return;
    }

    let input = deleteInput[index];
    let isConfirmed = window.confirm("Are you sure you want to delete this image?");

    if (isConfirmed) {
        let inputId = input.dataset.id;
        let xhr = new XMLHttpRequest();
        xhr.open('POST', `/delete-image/${inputId}`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onload = function() {
            if (xhr.status >= 200 && xhr.status < 300) {
                var data = JSON.parse(xhr.responseText);
                console.log(data);
                if (data.status === "ok") {
                    let container = input.closest('.image-container');
                    container.style.display = "none";
                }
            } else {
                console.error('Error:', xhr.statusText);
            }
        };
        xhr.onerror = function() {
            console.error('Request failed');
        };
        xhr.send();
    }
}

function deleteMainImageRequest() {
    let postId = document.getElementById("post_container_main").getAttribute("data");
    let isConfirmed = window.confirm("Are you sure you want to delete this image?");
    let InputAddMainImage = document.getElementById("post_mainImage");

    if (isConfirmed) {
        if (InputAddMainImage == null) {
            fetchDeleteMainImage(postId);

        } else {
            InputAddMainImage.value = "";
            document.getElementById("mainImage").src = "/images/empty_img.png";
            fetchDeleteMainImage(postId);
        }
    }
}

function fetchDeleteMainImage(postId) {
    let xhr = new XMLHttpRequest();
    xhr.open('POST', `/delete-main-image/${postId}`, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status >= 200 && xhr.status < 300) {
            var data = JSON.parse(xhr.responseText);
            console.log(data);
            document.getElementById("mainImage").src = "/images/empty_img.png";
        } else {
            console.error('Error:', xhr.statusText);
        }
    };
    xhr.onerror = function() {
        console.error('Request failed');
    };
    xhr.send();
}

function changeMainImageRender(fileInput) {
    var file = fileInput.files[0];
    if (file) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById("mainImage").src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
}

document.addEventListener("DOMContentLoaded", () => {
    var fileInput = document.getElementById("post_mainImage");

    fileInput.addEventListener("change", () => {
        changeMainImageRender(fileInput);
    });
});
