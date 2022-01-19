class Review < ApplicationRecord
  belongs_to :hug
  validates :evaluation, presence: true
  validates :description, presence: true
  validates :evaluation, numericality: { greater_than: 0, less_than: 6 }
end
