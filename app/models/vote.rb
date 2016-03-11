class Vote < ActiveRecord::Base
	belongs_to :votable, polymorphic: true
	belongs_to :voter

  # Remember to create a migration!
end
