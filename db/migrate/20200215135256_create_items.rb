class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :image_url
      t.string :genre

      t.timestamps
    end
  end
end
