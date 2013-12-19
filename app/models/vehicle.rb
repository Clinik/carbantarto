class Vehicle < ActiveRecord::Base
  attr_accessible :color, :manufacturer, :subtype, :user, :year, :vehicle_ids, :property_ids, :propvalues, :type, :avatar

  has_attached_file :avatar, 
  					:styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "./assests/images/rails.png",
  					:url  => "/assets/products/:id/:style/:basename.:extension",
            		:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  belongs_to :user
  #has_and_belongs_to_many :properties
  has_many :vehicleprops
  has_many :properties, :through => :vehicleprops
  accepts_nested_attributes_for :vehicleprops

end
