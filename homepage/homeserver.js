document.addEventListener("DOMContentLoaded", function() {
    for (const e of document.getElementsByClassName("link-template")) {
        if (e.dataset.href)
            e.href = e.dataset.href
                .replace("${HOST}", window.location.host)
                .replace("${PROTOCOL}", window.location.protocol);
    }
});