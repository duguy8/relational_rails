class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(input)
    where(name: input)
  end

  def self.partial_search(input)
    where("name ILIKE ?", "%#{input}%")
  end
end
