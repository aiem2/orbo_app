class ChangeGenderInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :gener, :gender
  end
end
