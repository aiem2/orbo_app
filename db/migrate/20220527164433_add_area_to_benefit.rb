class AddAreaToBenefit < ActiveRecord::Migration[7.0]
  def change
    add_column :benefits, :area, :string
  end
end
