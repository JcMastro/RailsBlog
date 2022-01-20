Rails.application.routes.draw do
  root "contact#index"

  resources :articles do
    resources :comments
  end

  resources :contacts do 
    resources :phones
  end
  
end
