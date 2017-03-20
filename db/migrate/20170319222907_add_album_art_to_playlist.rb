class AddAlbumArtToPlaylist < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :album_art, :string
  end
end
