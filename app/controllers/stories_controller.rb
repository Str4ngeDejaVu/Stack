class StoriesController < ApplicationController

	# before we run the show, edit, update and destroy
	# let's find the story we're talking about

	before_action :find_story, only: [:show, :edit, :update, :destroy]

	# controllers manage the urls, the data from the models
	# and our HTML views

	def index
		@username = "jay"
		@now = Time.now

		# @stories = ["Google", "Facebook", "Linkedin", "Foursquare", "Twitter"]

		# set the variable @stories
		# to all the records in our story database table

		# @stories = Story.order("votes_count desc, created_at desc")

		# if it has ?sort=recent in the url
		# then sort by created_at
		# if it has nothing, then do the popular ones
		if params[:sort] == "recent"
			# sort by created at
			@stories = Story.order("created_at desc")

		elsif params[:sort] == "featured"
			# sort by featured
			@stories = Story.where(is_featured: true).
			order("votes_count desc, title asc")

		else
			# sort by popular
			@stories = Story.order("votes_count desc, title asc")
		end

		# add in my pagination
		# overwrite the @stories variable with a paginated version
		@stories =@stories.page(params[:page]).per(10)
	end

	# this is the individual story page
	def show
		# params[:id] is the number of the url we are looking for
		# @story = Story.find(	params[:id]		)
	end

	# this is the form for the new story
	def new
		# the variable @story goes to the view
		# Story.new comes from the model
		@story = Story.new
	end

	# this is where the form data from the new .html.erb view goes
	def create
		@story = Story.new(story_params)

		if @story.save

			#let's add a flash of content to tell the user we've added this
			flash[:success] = "You've added a link! Yay!"

			# go back to the home page
			redirect_to root_path

		else

			render "new"

		end
	end

	# show the edit page
	def edit
		# @story = Story.find(	params[:id]		)
	end

	# actually update the database
	def update
		# @story = Story.find(	params[:id]		)

		if @story.update(story_params)

			flash[:success] = "Yay, you've updated this story"

			redirect_to story_path(@story)

		else

			render "edit"

		end
	end

	# actually destroy the record in the database
	def destroy
		# @story = Story.find(	params[:id]		)

		@story.destroy

		flash[:success] = "You've deleted this story"

		redirect_to root_path
	end

	# a shortcut for getting form data
	# story_params isn't part of rails, it's something we've made ourselves
	def story_params
		# white list
		params.require(:story).permit(:title, :description, :url, :tag_list)
	end

	# shortcut for finding the story from the url
	# find_story isn't part of rails, it's something we've made ourselves
	def find_story
		@story = Story.find(	params[:id]		)
	end
end
