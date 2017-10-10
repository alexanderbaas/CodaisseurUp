class Event < ApplicationRecord
  belongs_to :user

  validates :listing_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

end
