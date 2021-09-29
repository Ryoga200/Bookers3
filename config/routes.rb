Rails.application.routes.draw do
   devise_for :users
   root 'homes#top'
   get 'home/about', to: 'homes#about'
   resources :users
   resources :books do
     resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create, :destroy]
  end
end
