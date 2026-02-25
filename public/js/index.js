console.log("JS loaded");
message_box = document.querySelectorAll('.message-box');

if (message_box.length > 0) {
    setTimeout(() => {
        message_box.forEach(box => box.remove());
    }, 3000);
}