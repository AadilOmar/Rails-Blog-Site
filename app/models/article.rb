class Article
  include Mongoid::Document

  field :title
  field :text
  field :datePosted
	validates :title, presence: true, length: {minimum: 5}
	validates :text, presence: true, length: {minimum: 5}
	has_many :comments
  belongs_to :user
  
end
