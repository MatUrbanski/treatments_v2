Rails.application.routes.draw do
  root to: "ordering_units#index"
  resources :ordering_units
  resources :doctors
end
