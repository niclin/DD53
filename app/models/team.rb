class Team < ActiveRecord::Base
  has_many :team_users
  has_many :users, :through => :team_users, :source => :user

  validates :name, presence:  { error_message: "name can't be blank" }
  validates :domain, presence:  { error_message: "domain can't be blank" }
  validate :validate_username


  def validate_username
    if Team.where(domain: domain).exists?
      errors.add(:domain, :invalid)
    end
  end
end
