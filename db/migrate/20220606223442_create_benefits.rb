class CreateBenefits < ActiveRecord::Migration[7.0]
  def change
    create_table :benefits do |t|
      t.date :date_start
      t.date :date_end
      t.string :city
      t.string :state
      t.text :description
      t.string :area
      t.references :partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
