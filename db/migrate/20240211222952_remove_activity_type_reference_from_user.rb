# frozen_string_literal: true

class RemoveActivityTypeReferenceFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_reference :users, :activity_type, foreign_key: true
  end
end
