class RemoveUidFromWalks < ActiveRecord::Migration[6.1]
  def change
    remove_column :walks, :user_id, :integer
  end
end
