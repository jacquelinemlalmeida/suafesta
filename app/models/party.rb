class Party < ApplicationRecord
  belongs_to :user
  has_many :participants, dependent: :destroy

  after_create :generate_url_ending!

  enum status: { inativa: 0, ativa: 1 }

  validates :scheduled_at, :birthday_person_name, :birthday_person_age, :status, presence: true

  def generate_url_ending!
    normalized_name = I18n.transliterate(birthday_person_name.to_s).parameterize
    ending = "#{normalized_name}-#{id}"

    update_column(:url_ending, ending)
  end
end
