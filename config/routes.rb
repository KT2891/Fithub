Rails.application.routes.draw do
   #会員用
  devise_for :users,skip: :passwords, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: %i[registrations passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # top & about
  root "public/homes#top"

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
    resource :user, only: %i[edit] do
      get "confirm" => "users#confirm"
      patch "update" => "users#update", as: "update"
      patch "leave" => "users#leave", as: "leave"
    end

    # 投稿用
    # reply: comment to comment
    resources :posts, only: %i[index show create destroy] do
      resources :comments, only: %i[create destroy] do
        resources :replies, only: %i[create destroy]
      end
      # いいね用
      resource :favorite, only: %i[create destroy]
      # 通報投稿用
      resources :reports, only: :create
    end

    # トレーニング成果の日単位での表示・削除
    resources :training_sets, only: %i[index show destroy]
    # トレーニングメニューごとの追加・編集・削除
    resources :training_details, only: %i[new create edit update destroy]
    # 体重・体脂肪率の表示・追加・編集・削除機能
    resources :body_compositions, only: %i[index create update destroy]
    # お問い合わせ機能
    resource :request, only: :create
    # 通知確認画面
    resources :notifications, only: :index
    resources :searches, only: :index
  end

  namespace :admin do
    resources :posts, only: :destroy
    # 管理者/ユーザの確認とステータス等の編集
    resources :users, only: %i[index show edit update]
    # トレーニングメニューの追加
    resources :training_menus, except: :show
    patch "training_menu/update_status/:id" => "training_menus#status_update", as: "status_update"
    # お問い合わせの確認、既読への編集
    resources :requests, only: %i[index update]
    # 通報の確認
    resources :reports, only: %i[index update]
  end
  # エラー発生時
  match "*path", to: "public/errors#render_404", via: :all, constraints: lambda { |req| !(req.path =~ /\.(jpg|jpeg|png|gif)$/i) && !req.path.include?("rails/active_storage") }
  post '*path', controller: 'public/errors', action: 'render_500', constraints: lambda { |req| !(req.path =~ /\.(jpg|jpeg|png|gif|...)$/i) }
end