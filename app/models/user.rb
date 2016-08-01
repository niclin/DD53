class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable, :invitable
  has_many :orders
  has_many :menus
  has_many :events
  has_many :event_users
  has_many :participated_events, through: :event_users, source: :event
  has_many :menus


  include EmailConfirmable

  has_many :team_users
  has_many :teams, :through => :team_users, :source => :team

  accepts_nested_attributes_for :teams

  attr_accessor :team

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def remember_me
    true
  end

  def admin?
    is_admin
  end

  def to_admin
    self.update_columns(is_admin: true)
  end

  def to_normal
    self.update_columns(is_admin: false)
  end

  def join!(event)
    participated_events << event
  end

  def is_member_of?(event)
    participated_events.include?(event)
  end
end
