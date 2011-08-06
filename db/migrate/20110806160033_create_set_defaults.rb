class CreateSetDefaults < ActiveRecord::Migration
  def self.up
    change_column :users, :credits, :string, :default => "100"
    change_column :users, :maintenance, :string, :default => 'NA'
  end

  def self.down
  end
end
