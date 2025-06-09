class Participant < ApplicationRecord
  belongs_to :party
  has_many :guests, inverse_of: :participant, dependent: :destroy
  accepts_nested_attributes_for :guests, allow_destroy: true

  validates :full_name, :rg, presence: true

  before_save :uniqueness_rg

  private

  def uniqueness_rg
    sanitized_rg = rg.to_s.gsub(/[^a-zA-Z0-9]/, '').downcase

    self.rg = sanitized_rg

    if Participant.where.not(id: id).exists?(rg: sanitized_rg)
      errors.add(:rg, "já está em uso")
      throw :abort
    end
  end
end
