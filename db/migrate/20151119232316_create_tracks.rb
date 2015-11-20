class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :song, null: false
      t.string :track_designation, null: false
      t.text :lyrics
      t.integer :album_id, null: false
      t.timestamps null: false
    end
    add_index :tracks, :album_id
  end
end
