class RenameColumnsInArticle < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.rename :start, :start_date
      t.rename :end, :end_date
    end
  end

  def self.down
    change_table :articles do |t|
      t.rename :start_date, :start
      t.rename :end_date, :end
    end
  end
end
