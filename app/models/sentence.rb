class Sentence < ActiveRecord::Base
	belongs_to :story
	belongs_to :user
end
