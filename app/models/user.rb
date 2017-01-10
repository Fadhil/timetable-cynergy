class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :roles

  def is_admin?
    roles.include?(Role.where(name: "Admin").first)
  end

  def add_role(role_name)
    role = Role.where(name: role_name).first
    roles.push(role) unless role.nil?
  end

  def remove_role(role_name)
    role = Role.where(name: role_name).first
    roles.delete(role) unless role.nil?
  end
end
