class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :entry
      t.belongs_to :walker
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
