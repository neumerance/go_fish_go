Rails.application.routes.draw do
  apipie
  resources :games do
    collection do
      get :start
      get :fish
    end
  end
end
