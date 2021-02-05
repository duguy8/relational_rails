class Instrument < ApplicationRecord
  validates_presence_of :brand
  belongs_to :dealer

  def self.all_on_sale
    where(on_sale: true)
  end

  def self.filter_price(amount)
    where('price > ?', amount)
  end
end
