class CreateActiveDays < ActiveRecord::Migration[7.1]
  def change
    create_table :active_days do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :day
      t.date :start_week
      t.date :end_week
      t.string :mensage

      t.timestamps
    end
  end
end
