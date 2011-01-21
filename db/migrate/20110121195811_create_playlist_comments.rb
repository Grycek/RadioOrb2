class CreatePlaylistComments < ActiveRecord::Migration
  def self.up
    create_table :playlist_comments do |t|
      t.integer :broadcast_playlist_id
      t.integer :comment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :playlist_comments
  end
end
