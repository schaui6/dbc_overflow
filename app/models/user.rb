class User < ActiveRecord::Base
	has_many :questions, { :class_name => "Question", :foreign_key => :poster_id}
	has_many :answers, { :class_name => "Answer", :foreign_key => :responder_id } 
	has_many :comments, { :class_name => "Comment", :foreign_key => :commenter_id }
	has_many :votes, { :class_name => "Vote", :foreign_key => :voter_id }
  # Remember to create a migration!
end
