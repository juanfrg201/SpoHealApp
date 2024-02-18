class ChangeColumnTypesInRoute < ActiveRecord::Migration[7.1]
  def change
    remove_column :routes, :presure
    remove_column :routes, :level
    add_column :routes, :presure, :integer
    add_column :routes, :level, :integer
  end
end
