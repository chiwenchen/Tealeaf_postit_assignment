class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :voteable #polymorphic syntex
  validates :body, presence: true

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