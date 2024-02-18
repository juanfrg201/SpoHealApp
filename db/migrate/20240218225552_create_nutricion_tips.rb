class CreateNutricionTips < ActiveRecord::Migration[7.1]
  def change
    create_table :nutricion_tips do |t|
      t.string :name
      t.string :benefits

      t.timestamps
    end
  end
end
