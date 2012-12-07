class Locale < ActiveRecord::Base
  attr_accessible :name, :population, :state

  has_many :garbages
  has_many :idhs
end
