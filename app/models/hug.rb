class Hug < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, :description, :category, :price, :city, :address, :photo, presence: true
end
