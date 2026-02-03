Rails.application.routes.draw do
  get "sugar_gliders/new"
  get "sugar_gliders/create"
  get "sugar_gliders/show"
  root "top#index"

  # ログイン・新規登録
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  # マイページ
  get "mypage", to: "mypage#show", as: :mypage

  # マイモモンガ
  resource :sugar_glider, only: %i[new create edit update]

  # ヘルスチェック
  get "up", to: "rails/health#show", as: :rails_health_check
end
