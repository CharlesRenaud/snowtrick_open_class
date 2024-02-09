document.addEventListener('DOMContentLoaded', function() {
    var profileImg = document.getElementById("profile-img");
    var addNewProfileImg = document.getElementById("add_new_profile_img");

    profileImg.addEventListener("click", function () {
        addNewProfileImg.click();
    });

    addNewProfileImg.addEventListener("change", function() {
        if (addNewProfileImg.files && addNewProfileImg.files[0]) {
            var file = addNewProfileImg.files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                var imageSrc = e.target.result;
                profileImg.src = imageSrc;

                // Créer un objet FormData pour envoyer le fichier
                var formData = new FormData();
                formData.append('profile_image', file);

                // Envoyer la requête Fetch
                fetch('/change-profile-image', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (response.ok) {
                        console.log('Image uploaded successfully');
                    } else {
                        console.error('Error uploading image');
                    }
                })
                .catch(error => console.error('Error uploading image:', error));
            };

            reader.readAsDataURL(file);
        }
    });
});
