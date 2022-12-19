# frozen_string_literal: true

Rails.application.routes.draw do
  # PUBLIC PAGES
  root 'web#main'
  get '/tratamientos', to: 'web#treatments', as: :web_treatments
  get '/preguntas-frecuentes', to: 'web#frequently_asked_questions', as: 'frequently_asked_questions'
  get '/terminos-condiciones', to: 'web#terms_and_conditions', as: 'terms_and_conditions'

  # BACKOFFICE
  resources :treatments, except: [:show]
  resources :treatment_types, except: [:show]
  resources :professionals, except: [:show]
  resources :users, except: [:show]
  resources :faqs, except: [:show]
  resources :newsletters
  resources :terms_and_cons, only: %i[index edit update]
  resources :newsletters
  devise_for :users, path: 'auth'

  get '/preguntas-frecuentes', to: 'web#frequently_asked_questions', as: 'frequently_asked_questions'
  get '/terminos-condiciones', to: 'web#terms_and_conditions', as: 'terms_and_conditions'
  post '/create-newsletter', to: 'web#create_newsletter'
end
