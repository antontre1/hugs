class Booking < ApplicationRecord
  belongs_to :hug
  belongs_to :user
  validates :start_date, :end_date, presence: true

  def validation_dates
    if start_date && end_date
      errors.add(:start_date, "can't be in the past") if Date.today > start_date
      errors.add(:end_date, "can't be in the past") if Date.today > end_date
      errors.add(:start_date, "cannot be after end_date") if end_date < start_date
    end
  end
end
