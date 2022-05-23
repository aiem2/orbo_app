class AddPhoneToProspect < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :phone, :string
  end
end
