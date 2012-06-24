class DataUnique < ActiveRecord::Migration
  def self.up
    add_index :data_files, :path, :unique => true
  end

  def self.down
  end
end
