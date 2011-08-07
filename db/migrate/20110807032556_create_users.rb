class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :mail
      t.string :nickname
      t.string :phone
      t.integer :credits
      t.string :passwd
      t.string :maintenance
      t.boolean :Status

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
