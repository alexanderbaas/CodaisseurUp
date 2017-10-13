class Event < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_and_belongs_to_many :themes
  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings, source: :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

end
