class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title, :subscription_plans_attributes
  validates :editor, :title, presence: true
  validates :title, uniqueness: { scope: :editor }

  has_many :subscription_plans, inverse_of: :newspaper
  accepts_nested_attributes_for :subscription_plans
end
