/*global $*/
// トレーニング記録のフォーム追加処理
// 初期は3つで10個以上は警告発生
$(document).on('turbolinks:load', function() {
  var maxForms = 10; // 最大フォーム数を設定する
  var defaultCount = 3; // 最初のデフォルトカウント

  $('.add-form').click(function(e) {
    e.preventDefault();

    // 現在のフォーム数を取得
    var currentForms = $('.default-form').length;

    // 最大フォーム数を超えている場合は新しいフォームを追加しない
    if (currentForms >= maxForms) {
      alert('最大フォーム数に達しました');
      return;
    }

    // 新しいフォームをクローンして追加
    var newForm = $('.default-form:first').clone();
    newForm.find('input[type="text"]').val(''); // 入力フィールドを空にする

    // データ属性を設定
    newForm.find('input[type="text"]').each(function() {
      var fieldName = $(this).attr('name');
      var newFieldName = fieldName.replace(/\d+/, currentForms); // フィールド名を更新
      $(this).attr('name', newFieldName);
    });
    // カウントを増やす
    defaultCount++;

    // 新しいフォームにカウントを設定
    newForm.find('.set-count').text(defaultCount);

    $('.default-form:last').after(newForm);
  });
});

// トレーニングメニュー作成時の効果部位追加
// 初期は1箇所で最大3箇所まで選択可
$(document).on('turbolinks:load', function() {
  var maxForms = 3; // 最大フォーム数を設定する

  $('#part-select-add').click(function(e) {
    e.preventDefault();

    // 現在のフォーム数を取得
    var currentForms = $('.parts_select').length;

    // 最大フォーム数を超えている場合は新しいフォームを追加しない
    if (currentForms >= maxForms) {
      alert('最大フォーム数に達しました');
      return;
    }

    // 新しいフォームをクローンして追加
    var newForm = $('.parts_select:first').clone();
    newForm.find('input[type="text"]').val(''); // 入力フィールドを空にする

    $('.parts_select:last').after(newForm);
  });
});

// コメントの表示/非表示の処理
$(document).on('turbolinks:load', function() {
  $(document).on('click', '[id^=comment_show_btn-]', function() {
      var commentId = $(this).attr('id').split('-')[1]; // ボタンのIDからcommentIdを取得
      var commentWrap = $('#comment__wrap-' + commentId); // 対応するコメントのラッパーを取得
      var commentWrapText= $('#comment_show_btn_text-' + commentId); // 対応するコメントのラッパーを取得

      commentWrap.toggleClass('comment_show'); // コメントの表示/非表示を切り替え

      if (commentWrap.hasClass('comment_show')) {
        commentWrapText.text('-'); // テキストを"-"に変更
        commentWrapText.removeClass('btn-success').addClass('btn-danger'); // btn-successをbtn-dangerに切り替え
      } else {
        commentWrapText.text('+'); // テキストを"+"に変更
        commentWrapText.removeClass('btn-danger').addClass('btn-success'); // btn-dangerをbtn-successに切り替え
      }
  });

  $(document).on('click', '[id^=reply-btn-]', function() {
    var commentId = $(this).attr('id').split('-')[2];
    $('#comment-reply-form-' + commentId).toggleClass('comment__reply-form_show');
  });
});


$(document).on('turbolinks:load', function() {
  var followingBtn = $("#following_btn");
  var followersBtn = $("#followers_btn");
  followingBtn.on('click', function() {
    followingBtn.addClass("btn-success");
    followersBtn.removeClass("btn-success");
  });
  followersBtn.on('click', function() {
    followersBtn.addClass("btn-success");
    followingBtn.removeClass("btn-success");
  });
});

// 投稿フォーム切り替え用
document.addEventListener('turbolinks:load', () => {
  const btn1 = document.getElementById('form-btn1');
  const btn2 = document.getElementById('form-btn2');
  const btn3 = document.getElementById('form-btn3');
  const tab1 = document.getElementById('tab1');
  const tab2 = document.getElementById('tab2');
  const tab3 = document.getElementById('tab3');

  btn1.addEventListener('click', () => {
    tab1.hidden = false;
    tab2.hidden = true;
    tab3.hidden = true;
    btn1.classList.add('form-active');
    btn2.classList.remove('form-active');
    btn3.classList.remove('form-active');
  });

  btn2.addEventListener('click', () => {
    tab1.hidden = true;
    tab2.hidden = false;
    tab3.hidden = true;
    btn1.classList.remove('form-active');
    btn2.classList.add('form-active');
    btn3.classList.remove('form-active');
  });

  btn3.addEventListener('click', () => {
    tab1.hidden = true;
    tab2.hidden = true;
    tab3.hidden = false;
    btn1.classList.remove('form-active');
    btn2.classList.remove('form-active');
    btn3.classList.add('form-active');
  });
});

// 投稿画面にて即時にアップした写真を表示する
document.addEventListener('turbolinks:load', () => {
  const input = document.getElementById('image-upload');
  const imagePreview = document.getElementById('image-preview');

  input.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file) {
      imagePreview.src = URL.createObjectURL(file);
      imagePreview.hidden = false;
    } else {
      imagePreview.hidden = true;
    }
  });
});