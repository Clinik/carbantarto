class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :manufacturer
      t.string :subtype
      t.integer :year
      t.string :color
      t.integer :user

      t.timestamps
    end
  end
end
