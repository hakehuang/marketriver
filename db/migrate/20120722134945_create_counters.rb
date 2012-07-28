class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.integer :number

      t.timestamps
    end
  end
end
