function backlogin() {
    $.post(contextPath + '/huser/backlogin',
        $('#loginForm').serialize(),
        function (data) {
            if (data.result === 'ok' || data.result === 'logined') {
                window.location.href = contextPath + "/huser/home";
            } else {
                alert(data.message);
            }
        },
        'json'
    );
}