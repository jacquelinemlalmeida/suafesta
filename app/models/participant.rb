class Participant < ApplicationRecord
  has_many :guests, inverse_of: :participant, dependent: :destroy
  accepts_nested_attributes_for :guests, allow_destroy: true

   validates :full_name, :rg, presence: true
end
