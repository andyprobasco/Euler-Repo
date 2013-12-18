class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :poster, presence: true, 
					  length: { minimum: 2 }
  	validates :problem, presence: true,
  						numericality: {only_integer: true, greater_that_or_equal_to: 1, less_than_or_equal_to: 437}
	validates :text, presence: true,
  				length: { minimum: 5 }
end
