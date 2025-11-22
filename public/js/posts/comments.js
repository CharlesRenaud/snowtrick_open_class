var sendCommentBtn = document.getElementById("add_comment");
var commentTextarea = document.getElementById("comment_area");
var postId = document.getElementById("current-post").getAttribute("data");

sendCommentBtn.addEventListener("click", function () {
    var commentContent = commentTextarea.value;

    var data = {
        comment: commentContent
    };

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/add-comment/' + postId, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var responseData = JSON.parse(xhr.responseText);
            console.log(responseData);
            createCommentElement(responseData.comment);
            commentTextarea.value = "";
            fetchComments();
        } else {
            console.error('Error:', xhr.statusText);
        }
    };
    xhr.onerror = function () {
        console.error('Request failed');
    };
    if (commentContent.length > 2) {
        xhr.send(JSON.stringify(data));
    }
});

function createCommentElement(commentData) {
    var commentCard = document.createElement("div");
    commentCard.className = "comment-card";
    commentCard.id = "comment-card-" + commentData.id;

    if (commentData.author.role.includes('ROLE_ADMIN')) {
        var deleteButton = document.createElement("button");
        deleteButton.textContent = "Delete";
        deleteButton.classList.add("delete-comment-btn");
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
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/get-comments/' + postId, true);
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var responseData = JSON.parse(xhr.responseText);
            var commentContainer = document.getElementById("comment-container");
            commentContainer.innerHTML = "";

            responseData.comments.forEach(comment => {
                createCommentElement(comment);
            });
        } else {
            console.error('Error:', xhr.statusText);
        }
    };
    xhr.onerror = function () {
        console.error('Request failed');
    };
    xhr.send();
}

function removeComment(commentId) {
    let isConfirmed = window.confirm("Are you sure you want to delete this comment?");

    if (isConfirmed) {
        var data = {
            commentId: commentId,
            postId: postId
        };

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/delete-comment', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                var responseData = JSON.parse(xhr.responseText);
                console.log(responseData);
                var commentToDelete = document.getElementById("comment-card-" + commentId);
                commentToDelete.style.display = "none";
            } else {
                console.error('Error:', xhr.statusText);
            }
        };
        xhr.onerror = function () {
            console.error('Request failed');
        };
        xhr.send(JSON.stringify(data));
    }
}
