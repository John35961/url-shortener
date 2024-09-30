Rails.application.routes.draw do
  root 'links#index'

  resources :links, param: :slug, only: [:new, :create, :index, :show] do
    member do
      delete :destroy
    end

    collection do
      delete :destroy, action: :destroy_all
    end
  end

  get '/redirect/:slug', to: 'links#redirect', as: :redirect
end
