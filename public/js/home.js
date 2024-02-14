$(document).ready(function () {
    var offset = 15;
    var iconBouncing = $("#icon-bouncing");
    var iconBouncingUp = $("#icon-bouncing-up");
    var modalContainer = $("#modal-container");
    var modalBox = $("#modal-box");
    var confirmModal = $("#modal-btn");
    var section = $("#tricks-container");
    var loadMoreButton = $("#loadMore");

    function hideModal() {
        modalContainer.addClass("hidden");
        modalBox.addClass("hidden");
    }

    function goToPostsTop() {
        if (section.length > 0) {
            $('html, body').animate({
                scrollTop: section.offset().top - 20
            }, 0);
        }

    }
    confirmModal.on("click", hideModal);

    iconBouncing.on("click", goToPostsTop);
    iconBouncingUp.on("click", goToPostsTop);

    function loadMorePosts() {
        $.ajax({
            url: '/load-more-posts',
            type: 'GET',
            data: {
                offset: offset
            },
            dataType: 'json',
            success: function (response) {

                iconBouncingUp.addClass("displayed");
                var keysArray = Object.keys(response);
                var jsonLength = keysArray.length;
                if ((jsonLength-1 > 0)) {

                    for (var i = 0; i < (jsonLength-1); i++) {
                        var post = response[i];
                        console.log(post)

                        var newCard = '<div class="card">' + '<div class="card-media">';
                        if (post.mainImage) {
                            newCard += '<a href=post/'+post.slug+'> <img class="img" src="/uploads/images/' + post.mainImage + '"></a>';
                        } else {
                            newCard += '<a href=post/'+post.slug+'><img class="img" src="/images/empty_img.png"></a>';
                        }

                        if(!response["roles"].includes("ROLE_VISITOR")) {
                        // Ajout du titre et des actions
                        newCard += '</div>' +
                            '<div class="card-header">' +
                            '<a id="title-post-link" href="/post/'+post.title+'">'+
                            '<span class="card-title">' + post.title + '</span>' +
                            '</a>'+
                            '<span class="card-actions">' +
                            '<a class="edit-link" href="/post/' + post.slug + '/edit"><img class="icon-crud" src="/images/edit-icon.png"/></a>' +
                            '<form class="delete-form" method="post" action="/post/' + post.id + '" onsubmit="return confirm(\'Are you sure you want to delete this post?\');">' +
                            '<input type="hidden" name="_token" value="'+post.csrf_token+'">' +
                            '<button class="delete-btn">' +
                            '<img class="icon-crud" src="/images/bin-icon.png"/>' +
                            '</button>' +
                            '</form>' +
                            '</span>' +
                            '</div>' +
                            '</div>';
                        }else{
                            newCard += '</div>' +
                            '<div class="card-header">' +
                            '<a id="title-post-link" href="/post/'+post.title+'">'+
                            '<span class="card-title">' + post.title + '</span>' +
                            '</a>'+
                            '<span class="card-actions"></span>' +
                            '</div>' +
                            '</div>';
                        }

                        $("#post-container").append(newCard);
                    }

                    offset += jsonLength;
                    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
                } else {
                    loadMoreButton.prop("disabled", true).text("No more posts");
                }
            },
            error: function (response) {
                console.error('Error loading more posts');
            }
        });
    }
    loadMoreButton.on("click", loadMorePosts);
});
