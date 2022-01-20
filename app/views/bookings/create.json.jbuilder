if @booking.persisted?
  json.form json.partial!('bookings/form.html.erb', hug: @hug, booking: Booking.new)
  json.inserted_item json.partial!('hugs/booking.html.erb', booking: @booking)
else
  json.form json.partial!('bookings/form.html.erb', hug: @hug, booking: @booking)
end
