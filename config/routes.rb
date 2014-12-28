Rails.application.routes.draw do
  root to: "ordering_units#index"
  resources :ordering_units
  resources :doctors
  resources :treatment_types
  resources :patients
  resources :treatments
end
