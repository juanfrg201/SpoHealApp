class AddLinkToArrayToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :nutricion_tips, :links, :string, array: true, default: []
  end
end
