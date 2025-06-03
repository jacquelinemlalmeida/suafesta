class AddPartyRefToParticipants < ActiveRecord::Migration[7.2]
  def change
    add_reference :participants, :party, null: false, foreign_key: true
  end
end
