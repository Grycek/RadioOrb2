class CreateBroadcastPlaylists < ActiveRecord::Migration
  def self.up
    create_table :broadcast_playlists do |t|
      t.datetime :date
      t.text :description
      t.text :playlist
      t.integer :broadcast_id
      t.timestamps
    end
  end

  def self.down
    drop_table :broadcast_playlists
  end
end
