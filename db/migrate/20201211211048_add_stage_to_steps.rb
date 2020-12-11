class AddStageToSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :steps, :stage, :integer
  end
end
