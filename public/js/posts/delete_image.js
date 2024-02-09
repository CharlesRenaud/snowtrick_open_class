function deleteImageRequest(index) {

    index = (index - 1)
    console.log(index)

    let deleteInput = document.getElementsByClassName("delete_image_input");

    if (index < 0 || index >= deleteInput.length) {
        console.error('Invalid index');
        return;
    }

    let input = deleteInput[index];
    let isConfirmed = window.confirm("Are you sure you want to delete this image?");

    if (isConfirmed) {
        let inputId = input.dataset.id;
        console.log(inputId);

        fetch(`/delete-image/${inputId}`, {
            method: 'POST',
        }).then(response => response.json()).then(data => {
            console.log(data);
            if (data.status === "ok") {
                let container = input.closest('.image-container');
                container.style.display = "none";
            }
        }).catch(error => {
            console.error('Error:', error);
        });
    }
}



function deleteMainImageRequest() {

    let postId = document.getElementById("post_container_main").getAttribute("data");
    let isConfirmed = window.confirm("Are you sure you want to delete this image?");
    let InputAddMainImage = document.getElementById("post_mainImage");

    if (isConfirmed) {
        if (InputAddMainImage == null) {
            console.log("Fetch requis")
            fetchDeleteMainImage(postId)

        } else {
            console.log("Image deja presente")
            InputAddMainImage.value = "";
            document.getElementById("mainImage").src = "/images/empty_img.png"
            fetchDeleteMainImage(postId)
        }
    }
}

function fetchDeleteMainImage(postId) {
    fetch(`/delete-main-image/${postId}`, {
        method: 'POST',
    }).then(response => response.json()).then(data => {
        console.log(data);
        document.getElementById("mainImage").src = "/images/empty_img.png"

    }).catch(error => {
        console.error('Error:', error);
    });
}


function changeMainImageRender(fileInput) {
    var file = fileInput.files[0];
    if (file) {
        var reader = new FileReader();
        reader.onload = function (e) {
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