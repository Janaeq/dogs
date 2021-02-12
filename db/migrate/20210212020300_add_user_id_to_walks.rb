class AddUserIdToWalks < ActiveRecord::Migration[6.1]
  def change
    add_column :walks, :user_id, :integer
  end
end
