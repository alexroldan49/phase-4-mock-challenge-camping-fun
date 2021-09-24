class Signup < ApplicationRecord
  belongs_to :activity
  belongs_to :camper

  validates :time, length: {in: 0..23}
end
