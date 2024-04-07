# frozen_string_literal: true

class CreateCommunityPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :community_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.string :issue
      t.string :body

      t.timestamps
    end
  end
end
