class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :chart_id
      t.integer :song_id
      t.integer :nb_of_votes
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
