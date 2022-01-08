class RenameColumnBookingsDateFromBookings < ActiveRecord::Migration[6.1]
  def change
    change_table :bookings do |t|
      t.rename :booking_date, :start_date
    end
    add_column :bookings, :end_date, :date
  end
end
