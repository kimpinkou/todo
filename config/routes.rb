Rails.application.routes.draw do

  resources :users
  resources :tasks do
    collection do
      get "unclosed"
    end
    member do
      patch "done"
    end
  end

  root "pages#index"
  get "about", :to => "pages#about", :as => "about"
  get "place", :to => "pages#place", :as => "place"

end
