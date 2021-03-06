class Hug < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :title, :description, :category, :price, :address, :photo, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :description ],
    associated_against: {
      user: [ :username ]
    },
    using: {
      tsearch: { prefix: true }
    }
  def mean
    sum = 0
    reviews.each do |review| sum = sum + review.evaluation end
    if reviews.length == 0
      return "No review yet"
    else
      return sum / reviews.length
    end
  end

end
