class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :artist
      t.string :title
      t.string :thumbnail
      t.string :discogs_url

      t.timestamps
    end
  end
end
