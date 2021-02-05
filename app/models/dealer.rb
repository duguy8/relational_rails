class Dealer < ApplicationRecord
  validates_presence_of :name
  has_many :instruments

  def self.order_by
    order(created_at: :desc)
  end
end
