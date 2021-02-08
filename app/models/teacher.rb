class Teacher < ApplicationRecord
  validates_presence_of :name
  belongs_to :school

  def self.partial_search(input)
    where("name ILIKE ?", "%#{input}%")
  end

  def self.search(input)
    if input
      where(name: input)
    end
  end

  def self.college_graduates
    where(college_graduate: true)
  end

  def self.filter_salary(amount)
    where('salary > ?', amount)
  end

  def self.order_by_name
    order(:name)
  end
end
