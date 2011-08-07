class CreateSetUserDefaults < ActiveRecord::Migration
  def self.up
    create_table :set_user_defaults do |t|
     change_column :users, :credits, :string, :default => "100"
     change_column :users, :maintenance, :string, :default => 'NA'
    end
  end

  def self.down
  end
end
