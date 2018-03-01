class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :category
      t.string :title
      t.attachment :thumbnail
      t.text :description
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
