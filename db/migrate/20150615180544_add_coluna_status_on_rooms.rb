class AddColunaStatusOnRooms < ActiveRecord::Migration
  def change
    add_column 	  :rooms , :status, :boolean, default: true
  end
end
