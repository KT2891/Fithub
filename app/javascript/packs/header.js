$(document).ready(function() {
    var Login_btn = $('.guest-login');
    var Login_form = $(".main__form-wrap");

    if (Login_btn.length) {
        Login_btn.on('click', function() {
            if (Login_form.hasClass('show')) {
                Login_form.fadeTo(200, 0, function() {
                    Login_form.removeClass('show').addClass('hidden');
                });
            } else {
                Login_form.fadeTo(200, 0.8, function() {
                    Login_form.removeClass('hidden').addClass('show');
                });
            }
        });
    }
});