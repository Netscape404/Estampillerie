class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.attachment :thumbnail
      t.string :title
      t.text :description
      t.text :specifications
      t.integer :difficulty
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
