class AddPromptAttrToProducts < ActiveRecord::Migration
  def change
    add_column :products, :prompt, :boolean, :default => false
  end
end
