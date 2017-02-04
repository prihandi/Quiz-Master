Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'
  get '/answer/:id', to: 'home#show', as: 'answer'
  post '/answer', to: 'home#check_answer'
  patch '/answer/:id', to: 'home#check_answer'
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
