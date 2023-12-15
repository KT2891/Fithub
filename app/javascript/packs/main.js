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

// コメントの表示/非表示の処理
$(document).on('turbolinks:load', function() {
  $('#comment_show_btn').on('click', function() {
    $('.comment__wrap').toggleClass('comment_show');

    if ($('.comment__wrap').hasClass('comment_show')) {
      $(this).find('.btn-text').text('-'); // テキストを"-"に変更
      $(this).find('.btn').removeClass('btn-success').addClass('btn-danger'); // btn-successをbtn-dangerに切り替え
    } else {
      $(this).find('.btn-text').text('+'); // テキストを"+"に変更
      $(this).find('.btn').removeClass('btn-danger').addClass('btn-success'); // btn-dangerをbtn-successに切り替え
    }
  });

  $(document).on('click', '[id^=reply-btn-]', function() {
    var commentId = $(this).attr('id').split('-')[2];
    $('#comment-reply-form-' + commentId).toggleClass('comment__reply-form_show');
  });
});
