class AddColumnToDatafile < ActiveRecord::Migration
  def self.up
    add_column :data_files, :path, :string
    add_column :data_files, :user_id, :integer, :references => "users"
    add_column :data_files, :product_id, :integer, :references => "products"
  end

  def self.down
    remove_column :data_files, :product_id
    remove_column :data_files, :user_id
    remove_column :data_files, :path
  end
end
