class AddSegmentToRating < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :segment, :string
  end
end
