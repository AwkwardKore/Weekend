Rails.application.routes.draw do
  resources :places
  resources :admins
  resources :moods
  resources :categories
end
