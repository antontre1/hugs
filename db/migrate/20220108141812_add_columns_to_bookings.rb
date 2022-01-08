class AddColumnsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :status, :string
    add_column :bookings, :booking_date, :date
  end
end
