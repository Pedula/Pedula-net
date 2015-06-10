class RenameIdOnVinculo < ActiveRecord::Migration
  def change
  	rename_column :vinculo, :id_usuario, :user_id
  	rename_column :vinculo, :id_quarto, :room_id
  end
end

