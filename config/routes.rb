Rails.application.routes.draw do
  resources :employees

  get '/table', to: "employees#table", as: :table
  get '/tiles', to: "employees#tiles", as: :tiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "employees#index"
end
