class AddColumnRaitingToActivityRecomendation < ActiveRecord::Migration[7.1]
  def change
    add_column :activity_recomendations, :rating, :integer
  end
end
