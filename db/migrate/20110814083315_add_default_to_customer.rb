class AddDefaultToCustomer < ActiveRecord::Migration
  def self.up
    change_column_default(:customers, :credits, "100")
  end

  def self.down
  end
end
