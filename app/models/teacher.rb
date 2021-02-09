class Teacher < ApplicationRecord
  validates_presence_of :name
  belongs_to :school

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
