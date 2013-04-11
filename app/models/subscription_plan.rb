class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :newspaper_id, :price, :weekly
  validates :newspaper, :price, presence: true
  validates :newspaper_id, uniqueness: { scope: :weekly }
  validates_inclusion_of :weekly, in: [true, false]
  
  belongs_to :newspaper
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
