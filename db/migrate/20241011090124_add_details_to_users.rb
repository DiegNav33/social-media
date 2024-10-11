class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pseudo, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
    add_column :users, :bio_text, :text
  end
end
