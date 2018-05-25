Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'users/index'
  get 'users/add'
  post 'users/add' , to: 'users#create'
  delete 'users/:id(.:format)', to: 'users#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      resources :admins
      resources :students
      resources :users
      resources :session


      post 'session', to: 'session#create', as: 'login'
      delete 'session', to: 'session#destroy', as: 'logout'

      end
  end


end
