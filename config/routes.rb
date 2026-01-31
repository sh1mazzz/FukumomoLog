Rails.application.routes.draw do
  root "top#index"

  # ログイン・新規登録
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  get "mypage", to: "mypage#show", as: :mypage
  get "up", to: "rails/health#show", as: :rails_health_check
end
