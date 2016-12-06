class Survey < ApplicationRecord
  validates :name, presence: true

  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true
end
