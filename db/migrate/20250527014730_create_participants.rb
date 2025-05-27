class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.string :full_name
      t.string :phone
      t.string :rg

      t.timestamps
    end
  end
end
