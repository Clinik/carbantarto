class RenameOldTableToNewTable < ActiveRecord::Migration
  def change

  	rename_table :properties_vehicles, :vehicleprop

  end

end
