class RemoveAvailabilityFromWalkers < ActiveRecord::Migration[6.1]
  def change
    remove_column :walkers, :availability
  end
end
