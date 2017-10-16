class Api::BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event

      def create
        total_price = get_total_price(booking_params)
        booking = @event.bookings.new(booking_params.merge(total: total_price))

        if booking.save
          render status: 200, json: {
            message: "Booking successfully created",
            event: @event,
            booking: booking
          }.to_json
        else
          render status: 422, json: {
            message: "Booking could not be created",
            errors: booking.errors
          }.to_json
        end
      end

      def update
          total_price = get_total_price(booking_params)
          booking = @event.bookings.find(params[:id])

          if booking.update(booking_params.merge(total: total_price))
            render status: 200, json: {
              message: "Booking successfully updated",
              event: @event,
              booking: booking
            }.to_json
          else
            render status: 422, json: {
              message: "Booking could not be updated",
              errors: booking.errors
            }.to_json
          end
        end


        def destroy
            booking = @event.bookings.find(params[:id])
            booking.destroy

            render status: 200, json: {
              message: "Booking successfully deleted",
              event: @event,
              booking: booking
            }.to_json
          end


          
  private

  def get_total_price(booking_params)
    checkin = DateTime.parse(booking_params[:starts_at])
    checkout = DateTime.parse(booking_params[:ends_at])

    total_days = (checkout - checkin).to_i
    booking_params[:price].to_i * total_days
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :price)
  end

end
