class Instrument < ApplicationRecord
  validates_presence_of :brand
  belongs_to :dealer
end
