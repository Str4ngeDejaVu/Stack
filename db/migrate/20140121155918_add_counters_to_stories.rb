class AddCountersToStories < ActiveRecord::Migration
  def change

  	# what table, what column to add, what type
  	add_column :stories, :votes_count, :integer

  	add_column :stories, :comments_count, :integer

  	add_column :stories, :is_featured, :boolean, default: false

  end
end
