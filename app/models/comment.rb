class Comment < ActiveRecord::Base
  belongs_to :post
  validates :commenter, presence: true, 
					  length: { minimum: 2 }
  validates :body, presence: true, 
					  length: { minimum: 5 }
end
