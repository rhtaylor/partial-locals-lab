Rails.application.routes.draw do
  resources :classrooms
  resources :students 
  get '/hacked', to: 'students#backdoor' 
  
end
