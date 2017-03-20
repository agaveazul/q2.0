class ChangeSongLimitOnPlaylists < ActiveRecord::Migration[5.0]
  def change
    change_column :playlists, :song_limit, :string
  end
end
