class Comment < ActiveRecord::Base

  include Voteable #lib/voteable.rb

  belongs_to :user
  belongs_to :post

  validates :body, presence: true

end