class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :menus

  has_many :order_users
  has_many :participated_orders, through: :order_users, source: :order

  def admin?
    is_admin
  end

  def to_admin
    self.update_columns(is_admin: true)
  end

  def to_normal
    self.update_columns(is_admin: false)
  end

  def join!(order)
    participated_orders << order
  end

  def is_member_of?(order)
    participated_orders.include?(order)
  end
end
