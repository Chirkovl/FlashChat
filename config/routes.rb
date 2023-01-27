Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :chats, only: %i[show create], param: :title
  resources :messages, only: :create
  root to: "chats#index"
end
