class Locale < ActiveRecord::Base
  attr_accessible :name, :population, :state

  has_many :idhs
end
