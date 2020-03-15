class CreateOwnerships < ActiveRecord::Migration[6.0]
  def change
    create_table :ownerships do |t|
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :statsu
      t.string :media
      t.text :memo
      t.text :imp
      
      t.timestamps
      
      t.index [:user_id, :item_id , :type], unique: true
    end
  end
end
