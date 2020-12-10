class AddDateToJudicialSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :judicial_steps, :date, :date 
  end
end
