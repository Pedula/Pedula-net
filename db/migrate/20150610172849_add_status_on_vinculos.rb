class AddStatusOnVinculos < ActiveRecord::Migration
  def change
  	add_column 	  :vinculos, :status, :boolean, default: false
  end
end
