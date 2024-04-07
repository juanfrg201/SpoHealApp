# frozen_string_literal: true

class CreateUserActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :user_activities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
