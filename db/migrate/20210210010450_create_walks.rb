class CreateWalks < ActiveRecord::Migration[6.1]
  def change
    create_table :walks do |t|
      t.datetime :date_time
      t.belongs_to :walker
      t.belongs_to :dog
      
      t.timestamps
    end
  end
end
