class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User' # to make association more expressive, need to add the foreign_key and class_name
  # $post.creator <--OK
  # $post.user <--NO OK anymore 
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :url, presence: true

end