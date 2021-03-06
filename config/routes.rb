# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources :categories do
        resources :posts
      end
      resources :comments, only: %i[create]
    end
  end
end
