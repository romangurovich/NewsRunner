class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :newspaper_id, :price, :weekly
  validates :newspaper_id, :price, presence: true
  validates :newspaper_id, uniqueness: { scope: :weekly }
  
  belongs_to :newspaper
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
