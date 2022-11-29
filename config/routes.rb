# frozen_string_literal: true

Rails.application.routes.draw do
  resources :treatment_types
  resources :professionals
  resources :users
  devise_for :users, path: 'auth'
end
