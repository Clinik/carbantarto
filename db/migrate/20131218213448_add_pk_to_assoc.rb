class AddPkToAssoc < ActiveRecord::Migration
  def change
    add_column :vehicleprops, :id, :primary_key
  end
end
