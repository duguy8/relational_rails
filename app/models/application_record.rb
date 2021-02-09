class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(input)
    where(name: input)
  end

  def self.partial_search(input)
    where("name ILIKE ?", "%#{input}%")
  end

  def self.order_by_name
    order(:name)
  end

  def self.order_by_created_at
    order(created_at: :desc)
  end
end
