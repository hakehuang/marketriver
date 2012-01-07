class AddPersonalidToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :personalID, :string
  end
end
