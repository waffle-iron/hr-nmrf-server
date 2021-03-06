# frozen_string_literal: true
Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :taxonomies do
    resources :categories
  end
  get 'static_pages/home'

  resources :measure_categories
  resources :measure_indicators
  resources :recommendation_categories
  resources :recommendation_measures
  resources :categories do
    resources :recommendations, only: [:index, :show]
    resources :measures, only: [:index, :show]
  end
  resources :recommendations do
    resources :measures, only: [:index, :show]
  end
  resources :measures do
    resources :recommendations, only: [:index, :show]
  end
  resources :indicators do
    resources :measures, only: [:index, :show]
    resources :progress_reports, only: [:index, :show]
  end
  resources :progress_reports
  resources :due_dates
  resources :users
  resources :user_roles

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root to: 'static_pages#home'
end
