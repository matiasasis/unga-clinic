# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  devise_for :users, path: 'auth'
  resources :clients
end
