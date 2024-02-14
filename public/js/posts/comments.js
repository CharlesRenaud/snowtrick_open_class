var sendCommentBtn = document.getElementById("add_comment");
var commentTextarea = document.getElementById("comment_area");
var postId = document.getElementById("current-post").getAttribute("data")
var deleteCommentBtn = document.getElementById("delete-comment-btn");

sendCommentBtn.addEventListener("click", function () {
    var commentContent = commentTextarea.value;

    var data = {
        comment: commentContent
    };

    var options = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    };
    if (commentContent.length > 2) {
        fetch('/add-comment/' + postId, options)
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error('Error during the request.');
            })
            .then(data => {
                console.log(data);
                createCommentElement(data.comment);
                commentTextarea.value = "";
                fetchComments();
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
});

function createCommentElement(commentData) {
    var commentCard = document.createElement("div");
    commentCard.className = "comment-card";
    commentCard.id = "comment-card-" + commentData.id;

    if (commentData.author.role.includes('ROLE_ADMIN')) {
        var deleteButton = document.createElement("button");
        deleteButton.textContent = "Delete";
        deleteButton.classList.add("delete-comment-btn")
        deleteButton.onclick = function () {
            removeComment(commentData.id);
        };
        commentCard.appendChild(deleteButton);
    }

    var commentAuthor = document.createElement("div");
    commentAuthor.className = "comment-author";

    var authorImage = document.createElement("img");
    authorImage.className = "comment-author-img";
    authorImage.src = "/uploads/images/" + commentData.author.image;
    commentAuthor.appendChild(authorImage);

    var commentName = document.createElement("span");
    commentName.className = "comment-name";
    commentName.textContent = commentData.author.name;
    commentAuthor.appendChild(commentName);

    var commentDate = document.createElement("span");
    commentDate.className = "comment-date";
    commentDate.textContent = commentData.createdAt;
    commentAuthor.appendChild(commentDate);

    commentCard.appendChild(commentAuthor);

    var commentContent = document.createElement("p");
    commentContent.textContent = commentData.content;
    commentCard.appendChild(commentContent);

    var commentContainer = document.getElementById("comment-container");
    commentContainer.appendChild(commentCard);
}

function fetchComments() {
    fetch('/get-comments/' + postId)
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            throw new Error('Error during the request.');
        })
        .then(data => {
            var commentContainer = document.getElementById("comment-container");
            commentContainer.innerHTML = "";

            data.comments.forEach(comment => {
                createCommentElement(comment);
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

function removeComment($commentId) {
    let isConfirmed = window.confirm("Are you sure you want to delete this comment?");

    if (isConfirmed) {
        var data = {
            commentId: $commentId,
            postId: postId
        };

        var options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        };

        fetch('/delete-comment', options)
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error('Error during the request.');
            })
            .then(data => {
                console.log(data);
                var commentToDelete = document.getElementById("comment-card-" + String($commentId))
                commentToDelete.style.display = "none"
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
};



