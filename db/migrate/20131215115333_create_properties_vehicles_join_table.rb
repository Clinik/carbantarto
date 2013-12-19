class CreatePropertiesVehiclesJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :properties_vehicles, :id => false do |t|
	    t.integer :property_id
	    t.integer :vehicle_id
	end
  
	add_index :properties_vehicles, [:property_id, :vehicle_id]
  end

  def self.down
  	drop_table :properties_vehicles
  end
end
