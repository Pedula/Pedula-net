class CreateVinculos < ActiveRecord::Migration
  def change
    create_table :vinculos do |t|
      t.integer :id_quarto
      t.integer :id_usuario

      t.timestamps
    end
  end
end
