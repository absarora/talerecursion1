class Story < ActiveRecord::Base
	belongs_to :story_starter, class_name: "User"
	has_many :sentences
	has_many :story_teams
	has_many :users, through: :story_teams

end
