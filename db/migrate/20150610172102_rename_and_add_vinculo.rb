class RenameAndAddVinculo < ActiveRecord::Migration
  def change
  	rename_column :vinculos, :id_usuario, :user_id
  	rename_column :vinculos, :id_quarto, :room_id
  end
end
