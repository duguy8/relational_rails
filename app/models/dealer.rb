class Dealer < ApplicationRecord
validates_presence_of :name
has_many :instruments
end
