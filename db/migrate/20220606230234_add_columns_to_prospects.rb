class AddColumnsToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :status, :string, :default => 'Inscripción'
    add_column :prospects, :comments, :text, :default => "Sin comentarios internos"
  end
end
