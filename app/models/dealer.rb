class Dealer < ApplicationRecord
  validates_presence_of :name
  has_many :instruments

  def self.sort_by_instruments
    order(instruments_count: :desc)
  end
end
