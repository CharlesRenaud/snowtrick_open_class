var sendCommentBtn = document.getElementById("add_comment");
var commentTextarea = document.getElementById("comment_area");
var postId = document.getElementById("current-post").getAttribute("data")
var commentId = document.getElementById("comment-id").getAttribute("data")
var deleteCommentBtn = document.getElementById("delete-comment-btn");

sendCommentBtn.addEventListener("click", function() {
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

    fetch('/add-comment/'+ postId, options)
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            throw new Error('Erreur lors de la requête.');
        })
        .then(data => {
            console.log(data);
            var newComment = document.createElement("p");
            newComment.textContent = commentContent
            var commentContainer = document.getElementById("comment-container")
            if (commentContainer.firstChild) {
                commentContainer.insertBefore(newComment, commentContainer.firstChild);
            } else {
                commentContainer.appendChild(newComment);
            }
            commentTextarea.value = ""
        })
        .catch(error => {
            console.error('Erreur:', error);
        });
});

function removeComment($commentId) {

    var data = {
        commentId: $commentId,
        postId: postId
    };
    console.log(data)

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
            throw new Error('Erreur lors de la requête.');
        })
        .then(data => {
            console.log(data);
            var commentToDelete = document.getElementById("comment-card-"+String($commentId))
            console.log(commentToDelete)
            commentToDelete.style.display ="none"
        })
        .catch(error => {
            console.error('Erreur:', error);
        });
};



