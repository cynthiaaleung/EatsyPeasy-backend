Rails.application.routes.draw do

  resources :polls, only: [:index, :create, :show, :update, :results, :resultspage, :resultsdetails]
  resources :users, only: [:index, :create]
  
  post 'polls/create' => 'polls#create'
  get 'polls/show/:alpha_numeric_id' => 'polls#show'
  post 'polls/update' => 'polls#update'
  get 'polls/show/:alpha_numeric_id/results' => 'polls#results'
  post 'polls/resultspage' => 'polls#resultspage'
  post 'polls/resultsdetails' => 'polls#resultsdetails'
end
