class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
    end
    
    add_index :forums, :name, unique: true
  end
end
