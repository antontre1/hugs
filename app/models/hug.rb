class Hug < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, :description, :category, :price, :city, :address, presence: true
end
