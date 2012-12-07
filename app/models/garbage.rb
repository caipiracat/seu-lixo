class Garbage < ActiveRecord::Base
  attr_accessible :composting, :incineration, :landfill, :not_fixed, :open_air, :others, :sanitary_landfill, :screening, :total, :wetlands, :year

  belongs_to :local
end
