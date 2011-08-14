class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :status
      t.integer :price
      t.date :RentablePeriod
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
