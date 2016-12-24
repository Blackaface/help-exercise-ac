Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  namespace :api, path: "api/v1" do
      resources :messages
      match '*unmatched_route', to: 'base#error_404', via: :all
  end

  resources :messages do
    resources :comments
  end

  root 'messages#index'
end