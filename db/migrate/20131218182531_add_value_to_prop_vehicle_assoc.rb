class AddValueToPropVehicleAssoc < ActiveRecord::Migration
  def change
  	add_column :vehicleprops, :propvalue, :string
  end
end
