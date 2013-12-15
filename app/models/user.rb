class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vehicles


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def can?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  after_create :assign_default_role

  def assign_default_role
    add_role(:usr)
  end

end
