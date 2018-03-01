class CreateProjectFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :project_files do |t|
      t.attachment :file
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
