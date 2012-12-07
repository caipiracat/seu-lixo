class Idh < ActiveRecord::Base
  attr_accessible :education, :idhm, :income, :longevity, :year, :locale_id

  belongs_to :locale
end
