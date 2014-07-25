class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
    	t.text :completed_story
    	t.integer :story_starter_id

      t.timestamps
    end
  end
end
