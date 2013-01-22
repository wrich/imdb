class Vote < ActiveRecord::Base
  attr_accessible :movie_id, :user_id
  
  belongs_to :movie
  belongs_to :user
  
  validates_presence_of :movie, :user
  
  validate :user_cannot_have_more_than_three_votes
  validate :user_cannot_vote_for_the_same_movie_more_than_once

  def user_cannot_have_more_than_three_votes
    if self.user.votes.count >= 3
      errors.add(:user_id, "has already voted three times")
    end
  end
  
  def user_cannot_vote_for_the_same_movie_more_than_once
    if Vote.where(:user_id => self.user_id, :movie_id => self.movie_id).any?
      errors.add(:user_id, "has already voted for this movie")
    end
  end
end




