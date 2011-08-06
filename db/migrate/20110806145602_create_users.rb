class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.primary_key :id
      t.string :mail
      t.string :nickname
      t.decimal :phone
      t.integer :credits
      t.string :passwd
      t.string :maintanance
      t.boolean :maintanceStatus

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
