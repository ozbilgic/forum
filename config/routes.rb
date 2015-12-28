Rails.application.routes.draw do
  root 'forums#index'
  
  #Forum yolları------------------------------------------------
  get '/forumlar',    to: 'forums#index', as: :forums
  get '/forumlar/:id', to: 'forums#show',  as: :forum 
  #-------------------------------------------------------------

  #Kullanıcı yolları--------------------------------------------
  resource :session, only:[:new, :create, :destroy]
  get '/oturum_ac', to: 'sessions#new', as: :login
  delete '/oturumu_kapat', to: 'sessions#destroy', as: :logout

  #/users/new adresini /kaydol a yönlendir
  get '/users/new', to: redirect('/kaydol')
  #index için rota oluştur ma
  resources :users, except: :index
  #bu kod register_path ve register_url oluşturur
  get '/kaydol', to: 'users#new', as: :register
  get '/:id', to: 'users#show', as: :profile
  get '/:id/edit', to: 'users#edit', as: :edit_profile
  #-------------------------------------------------------------
end
