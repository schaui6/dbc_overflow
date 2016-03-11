class Question < ActiveRecord::Base
	has_many :votes, as: :votable
	belongs_to :poster
	has_many :answers
	has_many :comments, as: :commentable
  # Remember to create a migration!
end
