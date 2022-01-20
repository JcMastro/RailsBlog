Rails.application.routes.draw do
  root "contacts#index"

  resources :articles do
    resources :comments
  end

  resources :contacts do 
    resources :phones
  end
  
end
