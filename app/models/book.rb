class Book < ActiveRecord::Base
  attr_accessible :authors, :description, :title, :isbn

  validates :title, presence: true, uniqueness: true
  validates :authors, presence: true  
  validates_with IsbnValidator

end
