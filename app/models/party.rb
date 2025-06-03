class Party < ApplicationRecord
  belongs_to :user
  has_many :participants, dependent: :destroy

  enum status: { inativa: 0, ativa: 1 }

  validates :scheduled_at, :birthday_person_name, :birthday_person_age, :status, presence: true
end
