Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :requests

      resources :approval_statuses

      resources :visitor_demographics

      resources :attraction_categories

      resources :user_types

      resources :bookmarks

      resources :exhibit_comments

      resources :exhibits

      resources :recordings

      resources :attraction_comments

      resources :attractions

      resources :users
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root to: "users#index"
  resources :requests
  resources :approval_statuses
  resources :visitor_demographics
  resources :attraction_categories
  resources :user_types
  resources :bookmarks
  resources :exhibit_comments
  resources :exhibits
  resources :recordings
  resources :attraction_comments
  resources :attractions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
