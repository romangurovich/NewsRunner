class User < ActiveRecord::Base
  attr_accessible :name, :password, :remember_token, :subscription_plan_ids
  validates :name, :password, presence: true, uniqueness: true

  has_many :subscriptions
  has_many :subscription_plans, through: :subscriptions
end
