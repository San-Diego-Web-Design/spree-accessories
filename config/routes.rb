Rails.application.routes.draw do
  namespace :admin do
    resources :products do
      resources :accessories, :member => {:select => :post, :remove => :post}, :collection => {:available => :post, :selected => :get}
    end
  end
end
