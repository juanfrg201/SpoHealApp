class AddColumnActiveToUserRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :user_routes, :active, :boolean
    add_column :user_routes, :start_date, :date
    add_column :user_routes, :end_date, :date
  end
end
