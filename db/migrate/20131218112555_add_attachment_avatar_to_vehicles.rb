class AddAttachmentAvatarToVehicles < ActiveRecord::Migration
  def self.up
    add_attachment :vehicles, :avatar
  end

  def self.down
    remove_attachment :vehicles, :avatar
  end
end
