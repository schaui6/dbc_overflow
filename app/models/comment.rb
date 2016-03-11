class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :commenter
	has_many :votes, as: :votable
  # Remember to create a migration!
end
