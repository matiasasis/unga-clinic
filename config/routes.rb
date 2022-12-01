# frozen_string_literal: true

Rails.application.routes.draw do
  root 'application#default_route'
  resources :treatments, except: [:show]
  resources :treatment_types, except: [:show]
  resources :professionals, except: [:show]
  resources :users, except: [:show]
  devise_for :users, path: 'auth'
end
