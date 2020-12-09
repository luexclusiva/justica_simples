class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :cnj_number
      t.string :integer
      t.string :description
      t.string :translation

      t.timestamps
    end
  end
end
