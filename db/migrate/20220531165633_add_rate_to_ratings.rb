class AddRateToRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :rate, :float
  end
end
