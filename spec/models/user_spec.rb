require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

      describe "association with event" do
    let(:guest_user) { create :user, email: "email@email.com" }
    let(:host_user) { create :user, email: "otheremail@email.com" }

    let!(:event) {create :event, user: host_user}
    let!(:booking) {create :booking, event: event, user: guest_user}

      it "has bookings" do
          expect(guest_user.booked_events).to include(event)
      end
  end

end
