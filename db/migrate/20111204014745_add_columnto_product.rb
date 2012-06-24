class AddColumntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :quantity, :integer, :default => 1
    add_column :products, :beepoint, :integer, :default => 1
    add_column :products, :credit, :integer, :default => 1
    add_column :products, :location, :string, :default => "Taiwan"
  end

  def down
    remove_column :products, :quantity
    remove_column :products, :beepoint
    remove_column :products, :credit
    remove_column :products, :location
  end
end
