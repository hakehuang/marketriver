class CreateProductCataloges < ActiveRecord::Migration
  def self.up
    create_table :product_cataloges do |t|
      t.string :name, :presence => true
      t.references :product_type

      t.timestamps
    end
  end

  def self.down
    drop_table :product_cataloges
  end
end
