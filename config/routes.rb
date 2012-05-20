Gostozin::Application.routes.draw do
  root :to => "links#index"

  resources :links, :except => :show

  devise_for :users

  match "u/:username" => "users#links"

  get "/u/:username/edit" => "users#edit"
  put "/u/:username/update_data" => "users#update_data"

  get "/u/:username/pass" => "users#password"
  put "/u/:username/update_pass" => "users#update_pass"
  
  get "/u/:username/avatar" => "users#avatar"
end
