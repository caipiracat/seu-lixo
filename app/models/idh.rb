class Idh < ActiveRecord::Base
  attr_accessible :education, :idhm, :income, :longevity, :year

  belongs_to :locale
end
