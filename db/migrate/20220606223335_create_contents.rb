class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.date :date
      t.text :description
      t.text :donwload
      t.string :city
      t.string :state
      t.text :logo_url
      t.string :area
      t.text :link

      t.timestamps
    end
  end
end
