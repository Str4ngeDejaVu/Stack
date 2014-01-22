require 'obscenity/active_model'

class Comment < ActiveRecord::Base

	# a comment belongs to a story
	# this is our opposite association
	belongs_to :story

	# validations
	validates :body, length: { minimum: 10 }, obscenity: { sanitize: true, replacement: :vowels }

end
