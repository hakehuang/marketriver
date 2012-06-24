class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :nickname
      t.string :phone
      t.integer :credits
      t.string :maintenance
      t.boolean :Status
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
