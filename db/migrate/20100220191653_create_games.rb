class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.datetime :game_at
      t.string :opponent
      t.string :telivision
      t.string :radio
      t.string :location
      t.boolean :away, :default => false

      t.timestamps
    end
    
    add_index :games, :game_at
  end

  def self.down
    drop_table :games
  end
end
