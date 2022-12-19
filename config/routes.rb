# frozen_string_literal: true

Rails.application.routes.draw do
  # PUBLIC PAGES
  root 'web#main'
  get '/tratamientos', to: 'web#treatments', as: :web_treatments
  get '/tratamientos/:treatment_slug', to: 'web#treatment', as: :web_treatment
  get '/preguntas-frecuentes', to: 'web#frequently_asked_questions', as: 'frequently_asked_questions'
  get '/terminos-condiciones', to: 'web#terms_and_conditions', as: 'terms_and_conditions'
  post '/create-newsletter', to: 'web#create_newsletter'
  post '/send-contact-data', to: 'web#send_contact_data'

  # BACKOFFICE
  resources :treatments, except: [:show]
  resources :treatment_types, except: [:show]
  resources :professionals, except: [:show]
  resources :users, except: [:show]
  resources :faqs, except: [:show]
  resources :newsletters, except: [:show]
  resources :terms_and_cons, only: %i[index edit update]
  resources :contacts, except: [:show]
  devise_for :users, path: 'auth'
end
