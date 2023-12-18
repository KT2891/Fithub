Rails.application.routes.draw do

   #会員用
  devise_for :users,skip: :passwords, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: %i[registrations passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # top & about
  root "public/homes#top"
  get "about" => "public/homes#about"

  # 会員用画面
  scope module: :public do
    # 会員画面用
    # showで他人のプロフィール閲覧可能
    # relathionships: フォロー機能
    resources :users, only: %i[show] do
      resource :relationship, only: %i[create destroy]
      member do
        get "following" => "relationships#following"
        get "followers" => "relationships#followers"
      end
    end
    # 会員情報編集用
    # セキュリティ上、current_userを利用するためIDをつけない
    # confirm: 退会確認画面
    resource :user, only: %i[edit destroy] do
      get "confirm" => "users#confirm"
      patch "update" => "users#update", as: "update"
    end

    # 投稿用
    # reply: comment to comment
    resources :posts, only: %i[index show create destroy] do
      resources :comments, only: %i[create destroy] do
        resources :replies, only: %i[create destroy]
      end
      resource :favorite, only: %i[create destroy]
    end

    # トレーニング成果の日単位での表示・削除
    resources :training_sets, only: %i[index show destroy]
    # トレーニングメニューごとの追加・編集・削除
    resources :training_details, only: %i[new create edit update destroy]
    # 体重・体脂肪率の表示・追加・編集・削除機能
    resources :body_compositions, only: %i[index create update destroy]
    # お問い合わせ機能
    resource :request, only: %i[new create]
  end

  namespace :admin do
    resources :posts, only: :destroy
    # 管理者/ユーザの確認とステータス等の編集
    resources :users, only: %i[index show edit update]
    # トレーニングメニューの追加
    resources :training_menus, except: :show
    # お問い合わせの確認、既読への編集
    resources :requests, only: %i[index update]
  end

end