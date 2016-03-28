class User < ActiveRecord::Base
  # Remember to create a migration!
	has_many :questions, { :class_name => "Question", :foreign_key => :poster_id}
	has_many :answers, { :class_name => "Answer", :foreign_key => :responder_id } 
	has_many :comments, { :class_name => "Comment", :foreign_key => :commenter_id }
	has_many :votes, { :class_name => "Vote", :foreign_key => :voter_id }
	validates :username, :password, :email, presence: true
  	
  	has_secure_password

    # validates :password,
    # :length => { :minimum => 5 }

    validates_confirmation_of :password
 #  	def password 
 #  		@password ||= BCrypt::Password.new(password_hash)
 #  	end

	#  def password=(new_password)
	#   	@password = BCrypt::Password.create(new_password)
	#   	self.password_hash = @password
	# end

	# def authenticate(password)
	#  	self.password == password
	# end
end
