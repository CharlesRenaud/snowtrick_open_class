
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
    console.log(index)
    var goodIndex = parseInt(index)
    console.log(goodIndex)
    var imageBlackBg = document.getElementById("post_images");
    var imageContainer = document.getElementById("post_images_" + (goodIndex - 1));
    var imageBaliseContainer = document.getElementById("imageContainer_" + (goodIndex));
    var imageBalise = imageBaliseContainer.querySelector("img")
    var parentimageContainer = imageContainer.parentNode

    var inputSelected = document.getElementById("post_images_"+(goodIndex - 1)+"_uploadedFile")
    console.log("post_images_"+(goodIndex - 1)+"_uploadedFile")
    inputSelected.click()

    /*
    var btn = document.createElement("button");
    btn.innerHTML = "Validate";
    btn.classList.add("validate-btn");
    btn.setAttribute("type", "button");


    console.log("imageconainer", imageContainer)
  
    if (imageContainer) {

        var exisitingPreview = imageContainer.querySelector("img.preview-image");
        if (!exisitingPreview) {
            var exisitingPreviewImage = document.createElement("img");
            exisitingPreviewImage.classList.add("preview-image")
            exisitingPreviewImage.src = imageBaliseContainer.querySelector("img").src
            imageContainer.insertBefore(exisitingPreviewImage, imageContainer.firstChild);
        }

        var existingImageBtn = imageContainer.querySelector("div.browse-image");
        if (!existingImageBtn) {
            var newExistingImageBtn = document.createElement("div");
            newExistingImageBtn.textContent = "Choose image";
            newExistingImageBtn.classList.add("browse-image")
            imageContainer.insertBefore(newExistingImageBtn, imageContainer.firstChild);

            newExistingImageBtn.addEventListener('click', function () {
                var inputSelected = document.getElementById("post_images_"+(goodIndex - 1)+"_uploadedFile")
                console.log("post_images_"+index+"_uploadedFile")
                inputSelected.click()
            })
        } 

        var existingH4 = imageContainer.querySelector("h4");
        if (!existingH4) {
            var newChild = document.createElement("h4");
            newChild.textContent = "Edit image " + index + " : ";
            imageContainer.insertBefore(newChild, imageContainer.firstChild);
        } 


        if (parentimageContainer.tagName.toLowerCase() !== "li") {
            imageBlackBg.classList.toggle("view_black_bg")
        }

        imageContainer.appendChild(btn)
        var parentElement = imageContainer.parentElement;
        parentElement.style.display = "flex";
    }
    */
    console.log("good index", goodIndex)
    var newInputImage = document.getElementById("post_images_" + (goodIndex - 1) + "_uploadedFile")
    var inputValue = "";

    newInputImage.addEventListener('change', function () {
        console.log("changed", newInputImage.files[0]);

        if (newInputImage.files && newInputImage.files[0]) {
            var file = newInputImage.files[0];

            var reader = new FileReader();

            reader.onload = function (e) {
                inputValue = e.target.result;
                /*
                var currentPreviewSelector = document.getElementById("post_images_"+(goodIndex - 1))
                var exisitingPreview = currentPreviewSelector.querySelector("img.preview-image");
                exisitingPreview.src = inputValue
                */
                if(inputValue !== ""){
                    imageBalise.src = inputValue
                }
        
            };

            reader.readAsDataURL(file);

        }
        console.log("inputValue", inputValue)


    });
/*
    btn.onclick = function () {

        if(inputValue !== ""){
            imageBalise.src = inputValue
        }
        imageContainer.removeChild(btn)
        var parentElement = imageContainer.parentElement;
        parentElement.style.display = "none";
        if (parentimageContainer.tagName.toLowerCase() !== "li") {
            imageBlackBg.classList.toggle("view_black_bg")
        }
    };

*/
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

    console.log(index)
    waitForElementToBePresent("post_images_" + ((parseInt(index)) + currentImageIndex), function (imageContainer) {
        var imageContainer = imageContainer;
        console.log(imageContainer);

     
        var exisitingPreviewImage = document.createElement("img");
        exisitingPreviewImage.classList.add("preview-image")
        imageContainer.insertBefore(exisitingPreviewImage, imageContainer.firstChild);

        var newExistingImageBtn = document.createElement("div");
        newExistingImageBtn.textContent = "Choose image";
        newExistingImageBtn.classList.add("browse-image")
        imageContainer.insertBefore(newExistingImageBtn, imageContainer.firstChild);

        newExistingImageBtn.addEventListener('click', function () {
            var inputSelected = imageContainer.querySelector("input")
            console.log(imageContainer)
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

        console.log("imageContainer", imageContainer)

        imageContainer.appendChild(btnImage)


        var galleryParent = document.getElementById('gallery');
        var inputImage = document.getElementById("post_images_" + ((parseInt(index)) + currentImageIndex) + "_uploadedFile")
        var inputValue = ""
        console.log("inputImage", inputImage)

        inputImage.addEventListener('change', function () {
            console.log("changed");

            if (inputImage.files && inputImage.files[0]) {
                var file = inputImage.files[0];

                var reader = new FileReader();

                reader.onload = function (e) {
                    console.log(index, currentImageIndex)
                    inputValue = e.target.result;
                    var currentPreviewSelector = document.getElementById("post_images_"+( parseInt(index) + currentImageIndex))
                    var exisitingPreview = currentPreviewSelector.querySelector("img.preview-image");
                    exisitingPreview.src = inputValue
                    console.log("currentPreviewSelector",currentPreviewSelector)
                };

                reader.readAsDataURL(file);
            }
        });

        btnImage.onclick = function () {
            console.log("InpoutValue", inputValue)
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

    console.log(mainImageInput)
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
