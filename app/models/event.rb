class Event < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_and_belongs_to_many :themes

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

end
