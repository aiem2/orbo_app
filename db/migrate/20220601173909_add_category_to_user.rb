class AddCategoryToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :category, :string, :default => "Estándar"
  end
end
