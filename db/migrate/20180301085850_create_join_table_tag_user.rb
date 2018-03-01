class CreateJoinTableTagUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :users do |t|
      t.index [:tag_id, :user_id]
    end
  end
end
