class User

  include Mongoid::Document
  field :username
  field :password
  field :name
  field :email
  field :age, type: Integer
	has_many :comments
	has_many :articles
	validates :username, uniqueness: true	
  
end
