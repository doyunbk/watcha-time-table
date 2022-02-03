Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_up' => 'devise/registrations#new'
  end

  resources :courses
  resources :enrollments

  root 'welcome#index'

  # scope module: 'users' do
  #   resources :courses
  # end
  

  # root :to => "devise/sessions#new"
end

