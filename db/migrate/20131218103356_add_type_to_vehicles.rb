class AddTypeToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :type, :string
  end
end
