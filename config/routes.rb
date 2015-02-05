Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
get '/' => 'site#home'

resources :projects do
  resources :entries
end
resources :people

#        Prefix Verb URI    Pattern                                    Controller#Action
#                    GET    /                                                site#home
#    project_entries GET    /projects/:project_id/entries(.:format)          entries#index
#                    POST   /projects/:project_id/entries(.:format)          entries#create
#  new_project_entry GET    /projects/:project_id/entries/new(.:format)      entries#new
# edit_project_entry GET    /projects/:project_id/entries/:id/edit(.:format) entries#edit
#      project_entry GET    /projects/:project_id/entries/:id(.:format)      entries#show
#                    PATCH  /projects/:project_id/entries/:id(.:format)      entries#update
#                    PUT    /projects/:project_id/entries/:id(.:format)      entries#update
#                    DELETE /projects/:project_id/entries/:id(.:format)      entries#destroy
#           projects GET    /projects(.:format)                              projects#index
#                    POST   /projects(.:format)                              projects#create
#        new_project GET    /projects/new(.:format)                          projects#new
#       edit_project GET    /projects/:id/edit(.:format)                     projects#edit
#            project GET    /projects/:id(.:format)                          projects#show
#                    PATCH  /projects/:id(.:format)                          projects#update
#                    PUT    /projects/:id(.:format)                          projects#update
#                    DELETE /projects/:id(.:format)                          projects#destroy


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
