class AddUrlEndingToParties < ActiveRecord::Migration[7.2]
  def change
    add_column :parties, :url_ending, :string
    add_index :parties, :url_ending, unique: true
  end
end
