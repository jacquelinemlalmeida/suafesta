class CreateParties < ActiveRecord::Migration[7.2]
  def change
    create_table :parties do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :scheduled_at
      t.string :street
      t.string :number
      t.string :city
      t.string :state
      t.string :birthday_person_name
      t.integer :birthday_person_age
      t.integer :status
      t.string :timestamps

      t.timestamps
    end
  end
end
