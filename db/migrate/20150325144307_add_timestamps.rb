class AddTimestamps < ActiveRecord::Migration
  def change
  	add_column :posts, :created_at, :timestamps
  	add_column :posts, :updated_at, :timestamps
  	add_column :users, :created_at, :timestamps
  	add_column :users, :updated_at, :timestamps
  	add_column :comments, :created_at, :timestamps
  	add_column :comments, :updated_at, :timestamps
  	add_column :categories, :created_at, :timestamps
  	add_column :categories, :updated_at, :timestamps
  end
end
