class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :responder
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
  # Remember to create a migration!
end
