class Team < ActiveRecord::Base
  has_many :team_users
  has_many :users, :through => :team_users, :source => :user

  validates :name, presence: true
  validates :domain, presence: true
end
