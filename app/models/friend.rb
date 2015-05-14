class Friend

  include Mongoid::Document

  field :username
  field :email
  validates :username, uniqueness: {scope: :user}
  belongs_to :user

end 