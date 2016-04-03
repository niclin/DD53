class Order < ActiveRecord::Base
  has_many :order_users

  def status_open
    self.update_columns(status: true)
  end

  def status_close
    self.update_columns(status: false)
  end
end
