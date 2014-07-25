class CreateStoryTeams < ActiveRecord::Migration
  def change
    create_table :story_teams do |t|
    	t.integer :user_id 	
    	t.integer :story_id

      t.timestamps
    end
  end
end
