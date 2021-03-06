Rails.application.routes.draw do
  get 'courses/new'

  get 'admin/home'

  get 'addmin/help'

  get 'sessions/new'
  get 'users/new'

  # get 'taapp/form'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'taapp#index'
  get  'taapp/form'
  get  'taapp/register'
  get  'taapp/formerror'
  get  'taapp/professor'
  get  'taapp/proferror'
  get  'tapp/rate_professor'
  get  'taapp/admin'
  get  'taapp/adminerror'
  get  'taapp/successpage'
  get   '/form', to: 'taapp#form'
  get   'admin/refresh', to: 'courses#show'
  get   'taapp/show_applicants'
  get   'taapp/application_closed'
  get   'admin/index'
  get   'admin/edit'
  get   'admin/_admin'
  get   'admin/show'
  get   'admin/successpage'
  get   'admin/assign'
  post  'admin/select'


  get   'admin/success'
  get   'taapp/status'
  get   'admin/finalize'

  get   'assignment/view_apps'
  get   'assignment/assigned_tas'
  

  get   'admin/close'
  post  'admin/:id/edit' => 'admin#edit'
  #post  'admin/:id/edit' => 'admin#edit'

  
  post  'admin/home' => 'admin#home'
  get 'admin/:id/update' => 'admin#update'
  patch 'admin/:id/edit' => 'admin#edit'

  get   'coments/new'
  #post  'comments/:id/new' => 'comments#new'


  get   'taapp/rate_applicant'
  
  get   'comments/:id/new' => 'comments#new'

  resources :users
  resources :admin
  resources :taapp
  resources :comments
  resources :courses
  resources :coursesgi
  resources :assignment
  get    'login'   => 'sessions#new'
  get    'signup'  => 'admin#new'
  post   'login'   => 'sessions#create'
  post   'logout'  => 'sessions#destroy'
 # get    'edit'    =>  'admin#edit'
 


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
