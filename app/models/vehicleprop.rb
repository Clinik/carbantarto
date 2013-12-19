class Vehicleprop < ActiveRecord::Base
attr_accessible :property_id, :vehicle_id, :propvalue
	belongs_to :property
	belongs_to :vehicle

	def get_property_string
		return [self.property.name, self.propvalue]
	end

end