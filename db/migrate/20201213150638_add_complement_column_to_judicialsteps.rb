class AddComplementColumnToJudicialsteps < ActiveRecord::Migration[6.0]
  def change
    add_column :judicial_steps, :complement, :string
  end
end
