class PostCategory < ActiveRecord::Base
	belongs_to :posts
	belongs_to :category

end