Stack::Application.routes.draw do

# URLs for ActiveAdmin (it put itself in)
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # our routes file matches our URLs up with our controllers

  # i want to add in all the REST urls for the stories
  # e.g. index, show, new, create, edit, update, destroy

  resources :stories do
  	# this is called a nested resource
  	# basically meaning the urls for the comments are on the
  	# urls for stories
  	resources :comments

    # because votes are related to stories, just like comments # 
    resources :votes
  end

  # let's add in a homepage
  root "stories#index"

end
