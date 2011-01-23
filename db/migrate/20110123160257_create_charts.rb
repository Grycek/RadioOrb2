class CreateCharts < ActiveRecord::Migration
  def self.up
    create_table :charts do |t|
      t.integer :number
      t.text :description
      t.datetime :date
      t.timestamps
    end
  end

  def self.down
    drop_table :charts
  end
end
