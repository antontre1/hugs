class Hug < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :title, :description, :category, :price, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
