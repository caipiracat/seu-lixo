class Locale < ActiveRecord::Base
  attr_accessible :name, :population, :state, :email, :site

  has_many :garbages
  has_many :idhs
end
