class AddUrlOriginToJudicial < ActiveRecord::Migration[6.0]
  def change
    add_column :judicials, :url_origin, :string
  end
end
