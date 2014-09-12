$(function () {
    $(".bg-icon-left-add-friend").hover(
        function () {
            $(this).filter(':not(:animated)').animate({
                marginLeft: '0px'
            }, 'slow');
// This only fires if the row is not undergoing an animation when you mouseover it
        },
        function () {
            $(this).animate({
                marginLeft: '-120px'
            }, 'slow');
        });
    $(".bg-icon-left-comfirmation").hover(
        function () {
            $(this).filter(':not(:animated)').animate({
                marginLeft: '0px'
            }, 'slow');
// This only fires if the row is not undergoing an animation when you mouseover it
        },
        function () {
            $(this).animate({
                marginLeft: '-130px'
            }, 'slow');
        });
    //event change
    $(document).on('change','#content-chat',function(){
        sendMessage($('#content-chat').data('sending-user'),$('#content-chat').data('receiving-user'),$('#content-chat').val())
        testNullToDisabled('#content-chat','#btn-send-message')
    })

    //event keyup
    $(document).on('keyup','#content-chat',function(){
        testNullToDisabled('#content-chat','#btn-send-message')
    })

});

function sendMessage(sending_user, receiving_user, message){
    $.post('/individual_chats',{'individual_chat[sending_user]':sending_user,'individual_chat[receiving_user]':receiving_user, 'individual_chat[message]':message})
}

function testNullToDisabled(selectorToGetVal, selectorToDisabled){
    if($(selectorToGetVal).val()== ''){
        $(selectorToDisabled).prop('disabled',true)
    }else{
        $(selectorToDisabled).prop('disabled',false)
    }
}

function friendList() {
    $('.friend-list').slideToggle()
}
function toggleChat() {
    $('.chat-box-1').find('.chat-box-body').slideToggle();
    $('.chat-box-1').find('.chat-box-footer').slideToggle()
}
function setLanguage(val) {
    $.post('/homes/setLanguage', {val: val}, function () {
        location.reload(true);
    });
}

function get_user() {
    $.get('/users');

}
function get_confirm() {
    $.get('/friend_lists/confirm_list');
}
function closeChatBox() {
    $('.chat-box-1').fadeOut(100);
}
function openChatBox(sending_user, receiving_user) {
    $.get('/individual_chats/open_chat_box',{sending_user:sending_user, receiving_user:receiving_user})
}