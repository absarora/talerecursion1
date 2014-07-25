class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
    	t.string :sentence
    	t.integer :user_id
    	t.integer :story_id

      t.timestamps
    end
  end
end
