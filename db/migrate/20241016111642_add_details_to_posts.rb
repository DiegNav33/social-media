class AddDetailsToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :city, :string
  end
end
