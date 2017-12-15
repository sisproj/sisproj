function changeContent(key) {
    $('#messenger-main-container').load('messengerChat.do', {key: key});
}