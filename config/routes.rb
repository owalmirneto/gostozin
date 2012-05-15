Gostozin::Application.routes.draw do
  root :to => "links#index"

  resources :links

  devise_for :users

  match "/update" => "users#edit"

  match "u/:username" => "users#links"
end
