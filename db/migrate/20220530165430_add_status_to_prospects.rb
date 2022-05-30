class AddStatusToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :status, :string, :default => 'Inscripción'
  end
end
