class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.references :participant, null: false, foreign_key: true
      t.string :name
      t.string :rg
      t.integer :age
      t.string :guest_type

      t.timestamps
    end
  end
end
