class AddPhoneToPartner < ActiveRecord::Migration[7.0]
  def change
    add_column :partners, :phone, :string
  end
end
