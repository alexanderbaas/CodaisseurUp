require 'rails_helper'


def full_name
  full_name = first_name + last_name
end


RSpec.describe Profile, type: :model do

  describe "association with user" do
    let(:user) { create :user }

    it "belongs to a user" do
      profile = user.profile.build(full_name: "Something")

      expect(profile.user).to eq(user)
    end

    # OR, go the shoulda way:

      it { is_expected.to belong_to :user}
  end

end
