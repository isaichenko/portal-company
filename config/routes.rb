Rails.application.routes.draw do
  #devise_for :admins
  devise_for :admins, path: '', path_names: { sign_in: 'admin', sign_out: 'logout' }
  resources :employees

  get '/table',     		to: "employees#table",    		   as: :table
  get '/tiles',     		to: "employees#tiles",    		   as: :tiles
  get '/ip_phones', 		to: "employees#ip_phone", 		   as: :ip_phones
  get '/search',    		to: "employees#search",   		   as: :search_page
  get '/department_search', to: "employees#department_search", as: :department_search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "employees#index"
end
