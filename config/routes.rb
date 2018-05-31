Rails.application.routes.draw do
  post 'users/add' ,            to: 'users#create'
  post 'login',                 to: 'sessions#create'

  delete 'logout',              to: 'sessions#destroy'
  delete 'users/:id(.:format)', to: 'users#destroy'

  get 'login',                  to: 'sessions#new'
  get 'attendance/show'
  get 'users/index'
  get 'users/add'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      resources :admins
      resources :session
      resources :users
      resources :attendances


      post "/login"    => "session#create"
      delete "/logout" => "session#destroy"

      post 'attendance', to: 'attendances#create'
      get 'attendance',  to: 'attendances#index'

      end
  end


end
