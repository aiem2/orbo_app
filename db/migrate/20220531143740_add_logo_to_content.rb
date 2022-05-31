class AddLogoToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :logo_url, :text
  end
end
