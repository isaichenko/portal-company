Rails.application.routes.draw do
  resources :employees

  get '/table',     to: "employees#table",    as: :table
  get '/tiles',     to: "employees#tiles",    as: :tiles
  get '/ip_phones', to: "employees#ip_phone", as: :ip_phones
  get '/search',    to: "employees#search",   as: :search_page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "employees#index"
end
