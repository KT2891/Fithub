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
// コメント表示/非表示の切り替えのイベントリスナー
$(document).on('click', '[id^=comment_show_btn-]', function() {
    var commentId = $(this).attr('id').split('-')[1];
    var commentWrap = $('#comment__wrap-' + commentId);
    var commentWrapText = $('#comment_show_btn_text-' + commentId);

    commentWrap.toggleClass('comment_show');

    if (commentWrap.hasClass('comment_show')) {
        commentWrapText.text('-');
        commentWrapText.removeClass('btn-success').addClass('btn-danger');
    } else {
        commentWrapText.text('+');
        commentWrapText.removeClass('btn-danger').addClass('btn-success');
    }
});

// 返信ボタンのイベントリスナー
$(document).on('click', '[id^=reply-btn-]', function() {
    var commentId = $(this).attr('id').split('-')[2];
    $('#comment-reply-form-' + commentId).toggleClass('comment__reply-form_show');
});

// フォロー、フォロワーの切り替え
$(document).on('turbolinks:load', function() {
  const followingBtn = document.getElementById("following_btn");
  const followersBtn = document.getElementById("followers_btn");
  const followingTab = document.getElementById("relationship__wrap-following");
  const followersTab = document.getElementById("relationship__wrap-followers");

  if (followingBtn && followersBtn) {
    followingBtn.addEventListener('click', () => {
      followingBtn.classList.add('active');
      followersBtn.classList.remove('active');
      followingTab.hidden = false;
      followersTab.hidden = true;
    });
    followersBtn.addEventListener('click', () => {
      followingBtn.classList.remove('active');
      followersBtn.classList.add('active');
      followingTab.hidden = true;
      followersTab.hidden = false;
    });
  }
});

// 投稿フォーム切り替え用
document.addEventListener('turbolinks:load', () => {
  const btn1 = document.getElementById('form-btn1');
  const btn2 = document.getElementById('form-btn2');
  const btn3 = document.getElementById('form-btn3');
  const tab1 = document.getElementById('tab1');
  const tab2 = document.getElementById('tab2');
  const tab3 = document.getElementById('tab3');
  const postBtn1 = document.getElementById('all_posts_btn')
  const postBtn2 = document.getElementById('follow_posts_btn')
  const postTab1 = document.getElementById('all_posts');
  const postTab2 = document.getElementById('follow_posts');

  // btn1とtab1がnullでないか確認
  if (btn1 && tab1) {
    btn1.addEventListener('click', () => {
      tab1.hidden = false;
      tab2.hidden = true;
      tab3.hidden = true;
      btn1.classList.add('active');
      btn2.classList.remove('active');
      btn3.classList.remove('active');
    });
  }

  // btn2とtab2がnullでないか確認
  if (btn2 && tab2) {
    btn2.addEventListener('click', () => {
      tab1.hidden = true;
      tab2.hidden = false;
      tab3.hidden = true;
      btn1.classList.remove('active');
      btn2.classList.add('active');
      btn3.classList.remove('active');
    });
  }

  // btn3とtab3がnullでないか確認
  if (btn3 && tab3) {
    btn3.addEventListener('click', () => {
      tab1.hidden = true;
      tab2.hidden = true;
      tab3.hidden = false;
      btn1.classList.remove('active');
      btn2.classList.remove('active');
      btn3.classList.add('active');
    });
  }

  if (postBtn1 && postTab1) {
    postBtn1.addEventListener('click', () => {
      postTab1.hidden = false;
      postTab2.hidden = true;
      postBtn1.classList.add('active');
      postBtn2.classList.remove('active');
    });
  }

  if (postBtn2 && postTab2) {
    postBtn2.addEventListener('click', () => {
      postTab1.hidden = true;
      postTab2.hidden = false;
      postBtn1.classList.remove('active');
      postBtn2.classList.add('active');
    });
  }

});

document.addEventListener('turbolinks:load', function() {
  setupImageUpload('#image-upload', 'previews');
});

// プレビュー機能
function setupImageUpload(uploadClass, previewContainerID) {
  document.querySelectorAll(uploadClass).forEach(function(input) {
    input.addEventListener('change', function(event) {
      const files = event.target.files;
      const container = document.getElementById(previewContainerID);

      container.innerHTML = '';

      Array.from(files).forEach(function(file) {
        const img = document.createElement('img');
        img.setAttribute('class', 'col-lg-3 col-sm-5 mx-1 my-1');
        img.src = URL.createObjectURL(file);
        img.onload = function() {
          URL.revokeObjectURL(img.src);
        }
        container.appendChild(img);
      });
    });
  });
}

// 無限スクロール機能
$(document).on("turbolinks:load", function() {
  if ($("nav.pagination a[rel=next]").length){
    $(".posts_show").infiniteScroll({
      path: "nav.pagination a[rel=next]",
      append: ".posts__content-wrap",
      history: true,
      prefill: false,
      status: ".page-load-status",
      hideNav: ".pagination"
    });
  }
})

window.addEventListener('load', function() {
    // 2秒後に要素を非表示にする
    setTimeout(function() {
        var primaryElement = document.querySelector('.primary');
        if (primaryElement) {
            primaryElement.style.display = 'none';
        }
    }, 2000); // 2000ミリ秒（2秒）後に実行
});