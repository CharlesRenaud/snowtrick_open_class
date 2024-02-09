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

    function goToPosts() {
        window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
    }
    function goToPostsTop() {
        if (section.length > 0) {
            $('html, body').animate({
                scrollTop: section.offset().top - 20
            }, 0);
        }

    }
    confirmModal.on("click", hideModal);

    iconBouncing.on("click", goToPosts);
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
                var parsedResponse = JSON.parse(response);

                if (parsedResponse.length > 0) {
                    for (var i = 0; i < parsedResponse.length; i++) {
                        var post = parsedResponse[i];
                        var userId = $("script[src$='home.js']").data("user-id");

                        var newCard = '<div class="card">' + '<div class="card-media">';
                        if (post.mainImage) {
                                newCard += '<img class="img" src="/uploads/images/' + post.mainImage + '">';
                        }else{
                            newCard += '<img class="img" src="/images/empty_img.png">';
                        }

                        newCard += `
                                    </div>
                                    <div class="card-header">
                                        <span class="card-title">${post.title}</span>
                                        <span class="card-actions">
                                        <a href="/post/${post.id}/"><img class="icon-crud" src="/images/show-icon.png"/></a>
                                    `;
                        if (userId === post.author.id) {
                            newCard += `<a class="edit-link" href="/post/${post.id}/edit"><img class="icon-crud" src="/images/edit-icon.png"/></a>`;
                        }

                        newCard += `
                                    </span>
                                </div>
                                </div>`;

                        $("#post-container").append(newCard);
                    }

                    offset += parsedResponse.length;
                    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
                } else {
                    loadMoreButton.prop("disabled", true).text("No more posts");
                }
            },
            error: function (response) {
                console.error('Error loading more posts');
                console.log(response);
            }
        });
    }


    loadMoreButton.on("click", loadMorePosts);

});