class Order < ActiveRecord::Base
  belongs_to :user

  has_many :order_users
  has_many :members, through: :order_users, source: :user

  def status_open
    self.update_columns(status: true)
  end

  def status_close
    self.update_columns(status: false)
  end
end
