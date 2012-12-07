class Locale < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :name, :population, :state, :email, :site

  has_many :garbages
  has_many :idhs

  friendly_id :name, use: :slugged
end
