class Property < ActiveRecord::Base
attr_accessible :name, :property_id

  #has_and_belongs_to_many :vehicles
  has_many :vehicleprops
  has_many :vehicles, :through => :vehicleprops

end
