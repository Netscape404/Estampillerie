class CreateJoinTableTagProject < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :projects do |t|
      t.index [:tag_id, :project_id]
    end
  end
end
