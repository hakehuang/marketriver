class AddColumnToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :bank_info, :string
    add_column :customers, :address, :string
  end

  def self.down
    remove_column :customers, :bank_info
    remove_column :customers, :address
  end
end
