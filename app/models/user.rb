class User < ActiveRecord::Base
  attr_accessible :name, :password, :remember_token
  validates :name, :password, presence: true, uniqueness: true

  has_many :subscriptions
  has_many :subscription_plans, through: :subscriptions
end
