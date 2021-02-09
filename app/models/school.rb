class School < ApplicationRecord
  validates_presence_of :name
  has_many :teachers

  def self.order_by_created_at
    order(created_at: :desc)
  end

  def self.order_by_teacher_count
    joins(:teachers).group(:id).order('COUNT(teachers.id) DESC')
  end
end
