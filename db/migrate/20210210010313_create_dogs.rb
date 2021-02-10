class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :gender
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
