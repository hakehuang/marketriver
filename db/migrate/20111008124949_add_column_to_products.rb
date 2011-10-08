class AddColumnToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :cata_level_1, :string
    add_column :products, :cata_level_2, :string
    add_column :products, :sharemode, :enum, :limit => [:for_sale,:for_rent,:for_free], :default => :for_free 
  end

  def self.down
    remove_column :products, :cata_level_1
    remove_column :products, :cata_level_2
    remove_column :products, :sharemode
  end
end
