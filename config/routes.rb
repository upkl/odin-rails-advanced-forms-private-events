# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show

  resources :events

  resources :event_attendances, only: %i[new destroy]

  # Defines the root path route ("/")
  root 'events#index'
end
