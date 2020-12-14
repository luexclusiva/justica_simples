class AddDecisionToJudicialSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :judicial_steps, :decision, :text
  end
end
