class User

  include Mongoid::Document
  field :username
  field :password
  field :name
  field :email
  field :age, type: Integer
  field :friends, type: Array
  has_many :friends
	has_many :comments
	has_many :articles
	validates :username, uniqueness: true	
  
  def getAllFriends
    @array = Array.new
    puts "!!!!!!!!!!!!!!!"
    self.friends.each do |cur|
      puts cur.username
      User.all.each do |user|
        if user.username==cur.username
          @array<<user.id
        end
      end
      # @array << User.where(username: cur.id).first
      puts @array
    end
    puts "ASDFASDFA"
    return @array
  end


end
