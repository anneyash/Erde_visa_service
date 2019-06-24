Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  # ActiveAdmin.routes(self)

  namespace :admin do
    resources :forms do
      resources :questions, controller: 'forms/questions'
      resource :declaration, controller: 'forms/declarations', on: :edit
    end
    get 'created', to: 'created_forms#index'
  end
  get '/admin', to: 'admin/forms#index'

  resources :visa_applications do
    collection do
      get 'finished_form'
    end
  end
  resources :questions

  resources :users


  get 'landing', to:'layouts#landing'
  get 'choose_country', to:'layouts#choose_country'
  get 'country_page', to:'layouts#country_page'
  get 'country_page_2', to:'layouts#country_page_2'
  get 'country_page_3', to:'layouts#country_page_3'
  get 'country_page_4', to:'layouts#country_page_4'
  get 'account', to:'layouts#account'

  root to: "layouts#choose_country"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
