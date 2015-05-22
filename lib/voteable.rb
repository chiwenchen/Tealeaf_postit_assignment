#Rails Concern

module Voteable 
  extend ActiveSupport::Concern

    included do
      has_many :votes, as: :voteable #polymorphic syntex.
    end 

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

#User normal metaprogramming

=begin
module Voteable


  module InstanceMethods
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

  module ClassMethods
    def my_class_method
      has_many :votes, as: :voteable #polymorphic syntex.
    end
  end

end
=end
