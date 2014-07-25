class StoryTeam < ActiveRecord::Base
	belongs_to :user
	belongs_to :story
	
end
