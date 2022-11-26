Rails.application.routes.draw do
  resources :plants
  # patch "/plants/:id/stock", to: "plants#add_in_stock" 

end
