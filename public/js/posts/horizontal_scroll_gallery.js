$(document).ready(function () {
    $('.post-gallery').on('wheel', function (e) {
        e.preventDefault();

        this.scrollLeft += e.originalEvent.deltaY;
    })
});