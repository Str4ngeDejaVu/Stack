class Story < ActiveRecord::Base

	# this is an association in rails
	# our story has many comments AND has many votes
	has_many :comments
	has_many :votes

	# set up acts as taggable on
	acts_as_taggable

	validates :title, length: {  minimum: 5  }
	validates :description, length: {  minimum: 2  }
	validates :url, presence: true, uniqueness: {  message: "has already been submitted"  } 

	# i want to overwrite the url structuer in activerecord
	# activerecord is the rails way to manage models
	# to_param is the method we want to overwrite
	# i want my title to be something like 7-designer-news
	# this is my ID then my title as a url

	def to_param

		# putting a hash in a string lets the browser know you're inputting a variable
		"#{id}-#{title.parameterize}" 
	end

	# this is my OWN shortcut to make nice clean urls for our users
	def nice_url
		# i want to take the url
		# and i want to remove http://
		# and i want to remove www.
		# gsub is global substitution
		url.gsub("http://", "").gsub("www.", "")
	end

end
