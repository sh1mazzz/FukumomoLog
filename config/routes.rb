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

  # 今日の記録
  resources :daily_records, only: %i[new create index]

  # ヘルスチェック
  get "up", to: "rails/health#show", as: :rails_health_check
end
