$(document).ready(function () {
    var modalContainer = $("#modal-container");
    var modalBox = $("#modal-box");
    var confirmModal = $("#modal-btn");

    function hideModal() {
        modalContainer.addClass("hidden");
        modalBox.addClass("hidden");
    }


    confirmModal.on("click", hideModal);

});