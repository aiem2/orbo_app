class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.date :date
      t.text :description
      t.text :download
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
