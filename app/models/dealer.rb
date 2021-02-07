class Dealer < ApplicationRecord
  validates_presence_of :name
  has_many :instruments

  def self.sort_by_instruments
    order(instruments_count: :desc)
  end

  def self.search(input)
    if input
       where(name: input)
     else
       Dealer.all
    end
  end

  def self.order_by
    order(created_at: :desc)
  end
end
