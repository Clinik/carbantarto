class RenameOldTableToNewTableAgain < ActiveRecord::Migration
  def change

  	rename_table :vehicleprop, :vehicleprops

  end
end
