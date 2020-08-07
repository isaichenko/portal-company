Rails.application.routes.draw do
  #devise_for :admins
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :employees do
    put :sort, on: :collection
  end

  get '/table',     		to: "employees#table",    		   as: :table
  get '/tiles',     		to: "employees#tiles",    		   as: :tiles
  get '/ip_phones', 		to: "employees#ip_phone", 		   as: :ip_phones
  get '/search',    		to: "employees#search",   		   as: :search_page
  get '/department_search', to: "employees#department_search", as: :department_search

  #Static Pages
  get '/koblevo', to: "static_pages#koblevo", as: :koblevo
  #get '/program', to: "static_pages#program", as: :program
  #get '/exc_group1', to: "static_pages#exc_group1", as: :exc_group1
  #get '/exc_group2', to: "static_pages#exc_group2", as: :exc_group2
  #get '/exc_group3', to: "static_pages#exc_group3", as: :exc_group3
  #get '/training1', to: "static_pages#training1", as: :training1
  #get '/training2', to: "static_pages#training2", as: :training2
  #get '/training3', to: "static_pages#training3", as: :training3
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "employees#index"
end
