class Comment

  include Mongoid::Document  
  field :commenter
  field :body
  belongs_to :article
  
end
