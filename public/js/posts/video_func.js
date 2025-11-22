var initalIndex = document.getElementById("gallery").childElementCount;


function toggleVideoContainerClass(index) {
    var videoContainer = document.getElementById('videoContainer_' + index);
    if (videoContainer) {
        if (confirm("Delete Video ?")) {
            var goodIndexation
            goodIndexation = (parseInt(index) - 1)

            console.log(goodIndexation)
            console.log("index init", document.getElementById("post_videos_" + goodIndexation + "_title"))
            document.getElementById("post_videos_" + goodIndexation + "_title").value = "";
            videoContainer.style.display = "none";
        }
    }
}

function toggleVideoInput(index) {
    var goodIndex = parseInt(index)
    var videoBlackBg = document.getElementById("post_videos");
    var videoContainer = document.getElementById("post_videos_" + (goodIndex - 1));
    var videoIframeContainer = document.getElementById("videoContainer_" + (goodIndex));
    var videoIframe = videoIframeContainer.querySelector("iframe")
    var parentVideoContainer = videoContainer.parentNode

    var btn = document.createElement("button");
    btn.innerHTML = "Validate";
    btn.classList.add("validate-btn");
    btn.setAttribute("type", "button");

    if (videoContainer) {
        var existingH4 = videoContainer.querySelector("h4");
        if (!existingH4) {
            var newChild = document.createElement("h4");
            newChild.textContent = "Edit video " + index + " : ";
            videoContainer.insertBefore(newChild, videoContainer.firstChild);
        }


        if (parentVideoContainer.tagName.toLowerCase() !== "li") {
            videoBlackBg.classList.toggle("view_black_bg")
        }

        videoContainer.appendChild(btn)
        var parentElement = videoContainer.parentElement;
        parentElement.style.display = "flex";
    }

    btn.onclick = function () {
        console.log("good index", goodIndex)
        var newInputValue = document.getElementById("post_videos_" + (goodIndex - 1) + "_title").value
        console.log("value src", newInputValue)
        const regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/;
        const match = newInputValue.match(regex);
        var urlTransformee = "";
        if (match && match[1]) {
            urlTransformee = `https://www.youtube.com/embed/${match[1]}`;
        }

        videoIframe.src = urlTransformee


        videoContainer.removeChild(btn)

        var parentElement = videoContainer.parentElement;

        parentElement.style.display = "none";
        if (parentVideoContainer.tagName.toLowerCase() !== "li") {
            videoBlackBg.classList.toggle("view_black_bg")
        }
        if (urlTransformee === "") {
            videoIframeContainer.remove();
            console.log(videoContainer)
        }


    };


}

var currentVideoIndex = 0

function waitForElementToBePresent(elementId, callback) {
    var intervalId = setInterval(function () {
        var element = document.getElementById(elementId);
        if (element) {
            clearInterval(intervalId);
            callback(element);
        }
    }, 10);
}

function addVideoInput(index) {

    console.log(index)

    waitForElementToBePresent("post_videos_" + ((parseInt(index)) + currentVideoIndex), function (videoContainer) {
        var videoContainer = videoContainer;
        console.log(videoContainer);

        var newChild = document.createElement("h4");
        newChild.textContent = "Add a new video : ";
        videoContainer.insertBefore(newChild, videoContainer.firstChild);

        var videoBlackBg = document.querySelectorAll('.videos > li');

        var btn = document.createElement("button");
        btn.innerHTML = "Validate";
        btn.classList.add("validate-btn");
        btn.setAttribute("type", "button");

        var intIndex = parseInt(index)

        console.log("videoContainer", videoContainer)

        videoContainer.appendChild(btn)



        btn.onclick = function () {

            var galleryParent = document.getElementById('gallery');
            var inputVideo = document.getElementById("post_videos_" + (parseInt(index) + currentVideoIndex) + "_title")
            var inputValue = inputVideo.value
            const regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/;
            var match = inputValue.match(regex);
            var urlTransformee = "";
            if (match && match[1]) {
                urlTransformee = `https://www.youtube.com/embed/${match[1]}`;
            }


            if (urlTransformee !== "") {
                var htmlCode = `
		<div class="video-container" id="videoContainer_${(intIndex + 1) + currentVideoIndex}">
			<iframe width="500" height="320" src="${urlTransformee}"></iframe>
			<div class="video-actions">
				<a>
					<img onclick="toggleVideoInput(${(intIndex + 1) + currentVideoIndex})" class="icon-crud" src="/images/edit-icon.png">
					<img  href="#" onclick="toggleVideoContainerClass(${(intIndex + 1) + currentVideoIndex})" class=" delete-video icon-crud bin-icon" src="/images/bin-icon.png">

				</a>
			</div>
		</div>
	`;
                currentVideoIndex++

                galleryParent.innerHTML += htmlCode;

            } else {
                console.log("Invalid YouTube URL");
            }


            for (var key in videoBlackBg) {
                if (videoBlackBg.hasOwnProperty(key)) {
                    var video = videoBlackBg[key];
                    video.style.display = "none";
                }
            }
            var postVideo = document.getElementById("post_videos")
            videoContainer.removeChild(btn)
            videoContainer.style.display = "flex"
        }
    });

}