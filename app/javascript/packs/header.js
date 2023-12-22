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

var beforePos = 0;//スクロールの値の比較用の設定

//スクロール途中でヘッダーが消え、上にスクロールすると復活する設定を関数にまとめる
function ScrollAnime() {
    var customPosition = 100;
    var scroll = $(window).scrollTop();
    //ヘッダーの出し入れをする
    if(scroll == beforePos) {
    }else if(customPosition > scroll || 0 > scroll - beforePos){
    //ヘッダーが上から出現する
        $('.header__wrap').removeClass('UpMove'); 
        $('.header__wrap').addClass('DownMove');
    }else {
    //ヘッダーが上に消える
        $('.header__wrap').removeClass('DownMove');
        $('.header__wrap').addClass('UpMove');
    }
    
    beforePos = scroll;//現在のスクロール値を比較用のbeforePosに格納
}

// 画面をスクロールをしたら動かしたい場合の記述
$(window).scroll(function () {
  ScrollAnime();//スクロール途中でヘッダーが消え、上にスクロールすると復活する関数を呼ぶ
});var beforePos = 0;//スクロールの値の比較用の設定