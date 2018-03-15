Rails.application.routes.draw do
  root 'main#index'

  devise_for :users, path: :gurus,
                     path_names:  { sign_in: :login,
                                    sign_out: :logout },
                     controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }


  get :contact, to: 'contact#index'
  post :contact, to: 'contact#send_message'

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do 
      get :result
      post :gist
    end
  end

  resources :users, only: :show, path: :gurus do
    resources :badges, only: :index
  end

  get :admin, to: "admin/home#index"
  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: %[index]
    resources :badges, shallow: true
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
