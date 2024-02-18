class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.integer :level
      t.integer :presure

      t.timestamps
    end
  end
end
