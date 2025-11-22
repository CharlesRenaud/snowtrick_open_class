document.addEventListener('DOMContentLoaded', function () {
    var profileImg = document.getElementById("profile-img");
    var addNewProfileImg = document.getElementById("add_new_profile_img");

    if (profileImg) {
        profileImg.addEventListener("click", function () {
            addNewProfileImg.click();
        });
    }

    if (addNewProfileImg) {
        addNewProfileImg.addEventListener("change", function () {
            if (addNewProfileImg.files && addNewProfileImg.files[0]) {
                var file = addNewProfileImg.files[0];
                var reader = new FileReader();

                reader.onload = function (e) {
                    var imageSrc = e.target.result;
                    profileImg.src = imageSrc;

                    // Créer un objet FormData pour envoyer le fichier
                    var formData = new FormData();
                    formData.append('profile_image', file);

                    // Envoyer la requête XMLHttpRequest
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', '/change-profile-image', true);
                    xhr.onload = function () {
                        if (xhr.status >= 200 && xhr.status < 300) {
                            console.log('Image uploaded successfully');
                        } else {
                            console.error('Error uploading image');
                        }
                    };
                    xhr.onerror = function () {
                        console.error('Request failed');
                    };
                    xhr.send(formData);
                };

                reader.readAsDataURL(file);
            }
        });
    }
});
