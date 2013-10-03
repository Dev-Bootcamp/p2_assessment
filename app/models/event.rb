class Event < ActiveRecord::Base

  belongs_to :creator

  has_many :attendees
  
end
