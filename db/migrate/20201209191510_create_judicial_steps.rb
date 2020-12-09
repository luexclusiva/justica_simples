class CreateJudicialSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :judicial_steps do |t|
      t.references :step, null: false, foreign_key: true
      t.references :judicial, null: false, foreign_key: true

      t.timestamps
    end
  end
end
