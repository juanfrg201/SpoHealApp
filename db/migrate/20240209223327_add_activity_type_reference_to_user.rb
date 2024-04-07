# frozen_string_literal: true

class AddActivityTypeReferenceToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :activity_type, null: true, foreign_key: true
  end
end
