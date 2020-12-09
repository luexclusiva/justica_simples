class CreateUserJudicials < ActiveRecord::Migration[6.0]
  def change
    create_table :user_judicials do |t|
      t.references :judicial, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
