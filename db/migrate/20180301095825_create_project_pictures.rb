class CreateProjectPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :project_pictures do |t|
      t.attachment :picture
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
