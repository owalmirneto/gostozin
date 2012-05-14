Gostozin::Application.routes.draw do
  root :to => "links#index"

  resources :links

  devise_for :users

  # resources :users do
  #   member do
  #     post :update
  #   end

  #   collection do
  #     get :links
  #   end
  # end

  # member :users, as: "u/:username"
  match "u/:username" => "users#links"
end
