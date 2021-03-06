﻿function ShowPopupWindow(popupControlId) {
    popupControlId.Show();
}

function ShowIframePopupWindow(popupControl, contentURL) {
    try {
        var path = location.protocol + '//' + location.hostname + (location.port ? ':' + location.port : '') + contentURL;
        popupControl.SetContentUrl(path);
        popupControl.Show();
    }
    catch (e) {
        alert('JSError '+e.message);
    }
}


//Top Message
function ShowSuccessMessage(content) {    
    var wrapper = $('<div />').addClass('msg__success_wrapper');
    var save_content = $('<div />').addClass('msg_success_content').html(content);
        wrapper.append(save_content);

        wrapper.appendTo('#dvTopMessage');
        setTimeout(function () {
            wrapper.fadeOut(function () {
                wrapper.remove();
            });
        }, 3000);
}


function ShowInfoMessage(content) {
    var wrapper = $('<div />').addClass('msg_info_wrapper');
    var save_content = $('<div />').addClass('msg_info_content').html(content);
    wrapper.append(save_content);

    wrapper.appendTo('#dvTopMessage');
    setTimeout(function () {
        wrapper.fadeOut(function () {
            wrapper.remove();
        });
    }, 3000);
}
