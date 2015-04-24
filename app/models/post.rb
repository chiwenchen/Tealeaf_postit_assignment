class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User' # to make association more expressive, need to add the foreign_key and class_name
  # $post.creator <--OK
  # $post.user <--NO OK anymore 
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable #polymorphic syntex.

  validates :title, presence: true
  validates :url, presence: true

  def count_vote
    vote_up - vote_down
  end

  def vote_up
    self.votes.where(vote: true).size
  end

  def vote_down
    self.votes.where(vote: false).size
  end

  def vote_size
    self.votes
  end

end