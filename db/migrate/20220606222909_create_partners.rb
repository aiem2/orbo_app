class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :email
      t.string :area
      t.string :liason_name
      t.string :liason_phone
      t.string :liason_mail
      t.text :logo_url
      t.string :web
      t.string :fb
      t.string :ig
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end
