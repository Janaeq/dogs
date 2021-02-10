class CreateWalkers < ActiveRecord::Migration[6.1]
  def change
    create_table :walkers do |t|
      t.string :name
      t.text :bio
      t.string :availability
      
      t.timestamps
    end
  end
end
