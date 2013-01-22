class Movie < ActiveRecord::Base
  attr_accessible :director_id, :title, :year, :director
  
  belongs_to :director
  has_many :roles
  has_many :actors, :through => :roles
  has_many :votes
  
  # def director
  #   Director.find_by_id(self.director_id)
  # end
  
  # m = Movie.last
  # m.director # => ...
  
  # f = Movie.first
  # f.director # => ...
end
