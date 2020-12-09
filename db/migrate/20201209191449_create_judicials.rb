class CreateJudicials < ActiveRecord::Migration[6.0]
  def change
    create_table :judicials do |t|
      t.string :number
      t.integer :class

      t.timestamps
    end
  end
end
