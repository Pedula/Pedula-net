class RenameVinculosNoPlural < ActiveRecord::Migration
  def change
  	rename_column :vinculos, :user_id, :users_id
  	rename_column :vinculos, :room_id, :rooms_id
  end
end
