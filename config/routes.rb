# frozen_string_literal: true

Rails.application.routes.draw do
  root 'web#main'
  namespace :backoffice do
    resources :treatments, except: [:show]
    resources :treatment_types, except: [:show]
    resources :professionals, except: [:show]
    resources :users, except: [:show]
    resources :faqs, except: [:show]
    resources :terms_and_cons, only: %i[index edit update]
  end

  devise_for :users, path: 'auth'
end
