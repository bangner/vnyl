json.extract! album, :id, :artist, :title, :thumbnail, :discogs_url, :created_at, :updated_at
json.url album_url(album, format: :json)
