class RenameJudicialsClassColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :judicials, :class, :judicial_type
  end
end
