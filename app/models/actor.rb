class Actor < ActiveRecord::Base
  attr_accessible :dob, :name
  
  has_many :roles
  has_many(:movies, { :through => :roles })
  
  validates_presence_of :name
  
end
