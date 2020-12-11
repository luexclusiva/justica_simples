class AddPriorityToSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :steps, :priority, :integer
  end
end
