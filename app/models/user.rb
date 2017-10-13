class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_one :profile
  has_many :bookings, dependent: :destroy

  has_many :booked_events, through: :bookings, source: :event

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
            def has_profile?
             profile.present? && profile.persisted?
            end

            def full_name
             profile.full_name
            end

end
