Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope '(:locale)', locale: /en|pt-BR/ do

    resources :hangouts do
      member do
        get "share"
        patch "launch_vote"
        patch "cancel_hg"
        patch "close_vote"
        patch "submit_vote"
        get "submit_vote"
      end
      resources :confirmations, only: [:new, :create, :edit, :update, :destroy] do
      end
      

    end

    get 'profiles/show'

    root to: 'hangouts#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
