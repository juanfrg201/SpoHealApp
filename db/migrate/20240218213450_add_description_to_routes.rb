# frozen_string_literal: true

class AddDescriptionToRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :routes, :description, :string
  end
end
