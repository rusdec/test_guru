Rails.application.routes.draw do
  root 'main#index'

  devise_for :users,
             path: :gurus,
             path_names: {
               sign_in: :login,
               sign_out: :logout
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do 
      get :result
      post :gist
    end
  end

  get :admin, to: "admin/home#index"
  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: %[index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
