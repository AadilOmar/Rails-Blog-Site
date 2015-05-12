class User < ActiveRecord::Base

	has_many :comments
	has_many :articles
	validates :username, uniqueness: true	
	
end
