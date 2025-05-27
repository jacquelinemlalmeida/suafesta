class Guest < ApplicationRecord
  belongs_to :participant

  enum guest_type: { adult: 'adulto', child: 'criança' }
end
