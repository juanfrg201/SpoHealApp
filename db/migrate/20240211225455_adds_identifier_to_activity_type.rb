class AddsIdentifierToActivityType < ActiveRecord::Migration[7.1]
  def change
    add_column :activity_types, :identifier, :string
  end
end
