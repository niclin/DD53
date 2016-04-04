class Event < ActiveRecord::Base

  belongs_to :user

  has_many :event_users
  has_many :members, through: :event_users, source: :user
  has_many :orders
  def status_open
    self.update_columns(status: true)
  end

  def status_close
    self.update_columns(status: false)
  end
end
