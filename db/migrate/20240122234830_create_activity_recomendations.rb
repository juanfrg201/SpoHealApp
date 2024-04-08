class CreateActivityRecomendations < ActiveRecord::Migration[7.1]
  def change
    create_table :activity_recomendations do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
