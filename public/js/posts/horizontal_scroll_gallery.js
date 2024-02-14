$(document).ready(function () {
    $('.post-gallery').on('wheel', function (e) {
        e.preventDefault();

        this.scrollLeft += e.originalEvent.deltaY;
    })
    $('.post-gallery').on('click', '.img, .iframe-box', function (event) {
        event.stopPropagation();

        if ($(this).find('iframe').length) {
            console.log("L'élément enfant est un iframe.");
        }

        if ($(this).is('iframe')) {
            var iframeSrc = $(this).attr('src');
            var content = $('<iframe>').attr('src', iframeSrc);
        } else {
            
            var content = $(this).clone();
            if (content.find('.video-actions').length > 0) {
                content.find('.video-actions').remove();
            }
        }

        var modal = $('<div class="modal"></div>').append(content);

        $('body').append(modal);
    });

    $('body').on('click', function () {
        var modal = document.querySelector('.modal');
        if (modal) {
            modal.remove();
        }
    });


    
})
var toggledGallery = false;

function showMobileGallery() {
    if (toggledGallery) {
        $('.post-gallery').css('display', 'none');
        $('.btnViewGallery').text("Show Gallery");
    } else {
        $('.post-gallery').css('display', 'flex');
        $('.btnViewGallery').text("Hide Gallery");
    }
    toggledGallery = !toggledGallery;
}
