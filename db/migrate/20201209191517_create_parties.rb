class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.references :judicial, null: false, foreign_key: true
      t.string :role
      t.string :name

      t.timestamps
    end
  end
end
