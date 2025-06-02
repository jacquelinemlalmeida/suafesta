class Guest < ApplicationRecord
  belongs_to :participant

  enum guest_type: { adult: 'adulto', child: 'criança' }

  validates :name, :rg, presence: true, if: -> { adult? }
end
