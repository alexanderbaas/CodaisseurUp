require 'rails_helper'

# RSpec.describe Event, type: :model do
#   pending "add some examples to (or delete) "
#
#   describe "association with user" do
#   let(:user) { create :user }
#
#   it "belongs to a user" do
#     event = user.events.build(name: "Yoga Weekend")
#
#     expect(event.user).to eq(user)
#   end
#
#
#     it { is_expected.to belong_to :user}
# end
#
# end

describe "association with booking" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:event) { create :event, user: host_user }
  let!(:booking) { create :booking, event: event, user: guest_user }

  it "has guests" do
    expect(event.guests).to include(guest_user)
  end
end
