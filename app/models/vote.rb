class Vote < ActiveRecord::Base

	# counter_cache keeps how many votes there are in story.rb
	# uses votes_count by default
	belongs_to :story, counter_cache: true

end
