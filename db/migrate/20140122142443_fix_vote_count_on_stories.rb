class FixVoteCountOnStories < ActiveRecord::Migration
  def change

  	# stories is the table, votes_count is the field
  	change_column :stories, :votes_count, :integer, default: 0
  	# stories is the table, comments_count is the field
  	change_column :stories, :comments_count, :integer, default: 0 

  	# because we want to track this file, we need to "git add ."  
  end
end
