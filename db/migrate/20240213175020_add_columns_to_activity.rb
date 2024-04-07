# frozen_string_literal: true

class AddColumnsToActivity < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :link, :string, array: true, default: []
  end
end
