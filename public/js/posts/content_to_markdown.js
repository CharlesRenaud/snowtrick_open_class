$(document).ready(function () {
    var readMoreAction = $('#read-more');
    readMoreAction.on('click', () => {
        $('#post-content-markdown').toggleClass('show-all');
        readMoreAction.toggleClass("rotate-input")
    });
    var content = $('#post-content-span').html();
    var md = window.markdownit();
    var markdownContent = md.render(content);
    $('#post-content-markdown').html(markdownContent);
});