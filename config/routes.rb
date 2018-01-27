Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get :signup, to: 'users#new'
  resources :users, only: %i[create]

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: %i[index]
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

end
