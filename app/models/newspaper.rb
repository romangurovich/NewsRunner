class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title
  validates :editor, :title, presence: true
  validates :title, uniqueness: { scope: :editor }

  has_many :subscription_plans, inverse_of: :newspaper
end
