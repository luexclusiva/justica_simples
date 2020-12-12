class RemoveIntegerFromSteps < ActiveRecord::Migration[6.0]
  def change
    remove_column :steps, :integer
  end
end
