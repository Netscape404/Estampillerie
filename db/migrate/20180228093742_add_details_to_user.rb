class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_attachment :users, :avatar
    add_attachment :users, :cover_picture
    add_column :users, :username, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :birthdate, :date
    add_column :users, :gender, :boolean
    add_column :users, :biography, :text
    add_column :users, :address, :string
    add_column :users, :post_code, :integer
    add_column :users, :city, :string
    add_column :users, :country, :string

    add_index :users, :username, :unique => true
  end
end
