Rails.application.routes.draw do

 devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#top'
  get 'about' => 'items#about'
  get 'users/:id/top' => 'friends#top', as: 'user_top'
  get 'users/:id/memory' => 'users#memory', as: 'user_memory'
  get 'carts/:id/reserve' => 'carts#reserve', as:'reserve'
  post 'carts/:id/confirm' => 'carts#confirm', as: 'confirm'
  get 'users/:id/history' => 'users#history', as: 'user_history'
  post 'askconfirm' => 'asks#confirm', as: 'ask_confirm'
  get 'users/:id/leave' => "users#leave", as: 'leave'
  get 'users/:id/restore' => 'admins#user_restore', as: 'user_restore'
  get 'admin/:id/restore' => 'admins#admin_restore', as: 'admin_restore'



resources :items do
	resource :cart_item_prices, except: [:new, :show]
  resource :allergies, except: [:show, :new]
  resource :item_tastes, except: [:show, :new]
  resources :item_prices, except:[:show, :index, :new]
end
resources :reviews, except: [:show] do
	resource :comments, except: [:show, :index, :new]
end

resources :admins
resources :tastes, except: [:show, :new]
resources :histories
resource :item_histories, except: [:show, :new, :index]
resources :carts, except: [:index, :destroy, :edit]
resources :users do
  resources :friends do
    resources :likes, except: [:show, :new, :edit]
  	resources :memories
  end
end

resources :informations, except: [:show, :new, :edit]
resources :sizes, except: [:show, :new]

resources :materials, except: [:show, :new]
resource :item_images, except: [:show, :new, :index]
resources :asks

end