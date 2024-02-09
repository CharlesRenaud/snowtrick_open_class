document.addEventListener('DOMContentLoaded', function() {
    var selectGroupeInput = document.getElementById("groupe-select");
    var groupeTextInput = document.getElementById("post_groupe");

    selectGroupeInput.addEventListener("change", function() {
        // Utilisation de selectGroupeInput.value pour obtenir la valeur de l'option sélectionnée
        groupeTextInput.value = selectGroupeInput.value;
    });
});
