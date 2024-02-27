
function toggleImageContainerClass(index) {
    var imageContainer = document.getElementById('imageContainer_' + index);
    if (imageContainer) {
        if (confirm("Delete Image ?")) {
            document.getElementById("post_images_" + (parseInt(index) - 1) + "_uploadedFile").value = "";
            imageContainer.style.display = "none";
        }

    }
}

function toggleImageInput(index) {
    var goodIndex = parseInt(index)
    var imageBaliseContainer = document.getElementById("imageContainer_" + (goodIndex));
    var imageBalise = imageBaliseContainer.querySelector("img")

    var inputSelected = document.getElementById("post_images_"+(goodIndex - 1)+"_uploadedFile")
    inputSelected.click()

    var newInputImage = document.getElementById("post_images_" + (goodIndex - 1) + "_uploadedFile")
    var inputValue = "";

    newInputImage.addEventListener('change', function () {

        if (newInputImage.files && newInputImage.files[0]) {
            var file = newInputImage.files[0];

            var reader = new FileReader();

            reader.onload = function (e) {
                inputValue = e.target.result;
                
                if(inputValue !== ""){
                    imageBalise.src = inputValue
                }
        
            };

            reader.readAsDataURL(file);

        }
    });
}


var currentImageIndex = 0

function waitForElementToBePresent(elementId, callback) {
    var intervalId = setInterval(function () {
        var element = document.getElementById(elementId);
        if (element) {
            clearInterval(intervalId);
            callback(element);
        }
    }, 10);
}

function addImageInput(index) {

    waitForElementToBePresent("post_images_" + ((parseInt(index)) + currentImageIndex), function (imageContainer) {
        var imageContainer = imageContainer;
     
        var exisitingPreviewImage = document.createElement("img");
        exisitingPreviewImage.classList.add("preview-image")
        imageContainer.insertBefore(exisitingPreviewImage, imageContainer.firstChild);

        var newExistingImageBtn = document.createElement("div");
        newExistingImageBtn.textContent = "Choose image";
        newExistingImageBtn.classList.add("browse-image")
        imageContainer.insertBefore(newExistingImageBtn, imageContainer.firstChild);

        newExistingImageBtn.addEventListener('click', function () {
            var inputSelected = imageContainer.querySelector("input")
            inputSelected.click()
        })
        

        var newChild = document.createElement("h4");
        newChild.textContent = "Add a new image : ";
        imageContainer.insertBefore(newChild, imageContainer.firstChild);

        var imageBlackBg = document.querySelectorAll('.images > li');

        var btnImage = document.createElement("button");
        btnImage.innerHTML = "Validate";
        btnImage.classList.add("validate-btnImage");
        btnImage.setAttribute("type", "button");

        var intIndex = parseInt(index)

        imageContainer.appendChild(btnImage)


        var galleryParent = document.getElementById('gallery');
        var inputImage = document.getElementById("post_images_" + ((parseInt(index)) + currentImageIndex) + "_uploadedFile")
        var inputValue = ""

        inputImage.addEventListener('change', function () {

            if (inputImage.files && inputImage.files[0]) {
                var file = inputImage.files[0];

                var reader = new FileReader();

                reader.onload = function (e) {
                    inputValue = e.target.result;
                    var currentPreviewSelector = document.getElementById("post_images_"+( parseInt(index) + currentImageIndex))
                    var exisitingPreview = currentPreviewSelector.querySelector("img.preview-image");
                    exisitingPreview.src = inputValue
                };

                reader.readAsDataURL(file);
            }
        });

        btnImage.onclick = function () {
            if (inputValue !== "") {
                var htmlCode = `
            <div class="image-container" id="imageContainer_${(intIndex + 1) + currentImageIndex}">
                <img src="${inputValue.toString()}"></iframe>
                <div class="image-actions">
                    <a>
                        <img onclick="toggleImageInput(${(intIndex + 1) + currentImageIndex})" class="icon-crud" src="/images/edit-icon.png">
                        <img  href="#" onclick="toggleImageContainerClass(${(intIndex + 1) + currentImageIndex})" class=" delete-video icon-crud bin-icon" src="/images/bin-icon.png">
    
                    </a>
                </div>
            </div>
        `;

                galleryParent.innerHTML += htmlCode;
                currentImageIndex++

            } else {
                currentImageIndex++
                console.log("Invalid Image URL");
            }


            for (var key in imageBlackBg) {
                if (imageBlackBg.hasOwnProperty(key)) {
                    var image = imageBlackBg[key];
                    image.style.display = "none";
                }
            }
            imageContainer.removeChild(btnImage)
            imageContainer.style.display = "flex";
        }
    });

}

document.addEventListener("DOMContentLoaded", function() {
    toggleMainImageContainer();
});

function toggleMainImageContainer () {
    var mainImageInput = document.querySelector(".edit-link.banner input");
    var mainImageToggler = document.querySelector(".edit-link.banner img");

    mainImageToggler.addEventListener("click", function() {
        mainImageInput.click();
    })

    mainImageInput.addEventListener('change', function () {

        if (mainImageInput.files && mainImageInput.files[0]) {
            var file = mainImageInput.files[0];

            var reader = new FileReader();

            reader.onload = function (e) {
                inputValue = e.target.result;
            };

            reader.readAsDataURL(file);
        }
    });
}
