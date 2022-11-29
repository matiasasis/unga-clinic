# frozen_string_literal: true

Rails.application.routes.draw do
  root 'professionals#index'
  resources :treatment_types, except: [:show]
  resources :professionals, except: [:show]
  resources :users, except: [:show]
  devise_for :users, path: 'auth'
end
