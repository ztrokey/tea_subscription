Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: :show do
        resources :subscriptions, only: %i[create update index]
      end
    end
  end
end
