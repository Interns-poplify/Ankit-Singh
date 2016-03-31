Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :authors, :controller => {:omniauth_callbacks => "omniauth_callbacks"}
  root to: 'articles#index'
 get "/profile/:id" => 'articles#profile',as: :profile
  resources :articles do
    resources :comments
 
  end
  resources :tags


end
