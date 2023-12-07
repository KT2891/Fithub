Rails.application.routes.draw do

  #会員用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # top & about
  root to: "public/homes#top"
  get "about" => "public/homes#about"

  # 会員用画面
  scope module: :blog do
    resources :posts, only: %i[index show create destroy]
  end

end