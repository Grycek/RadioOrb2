class CreatePresenters < ActiveRecord::Migration
  def self.up
    create_table :presenters do |t|
      t.integer :user_id
      t.integer :broadcast_id

      t.timestamps
    end
  end

  def self.down
    drop_table :presenters
  end
end
