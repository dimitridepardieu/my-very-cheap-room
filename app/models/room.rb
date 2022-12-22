class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy

  validates :capacity, :price_per_night, presence: true
  validates :capacity, numericality: { only_integer: true }
  validates :price_per_night, numericality: true
  validates :capacity, :price_per_night, comparison: { greater_than: 0 }
end
