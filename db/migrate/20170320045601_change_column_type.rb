class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    remove_column :playlists, :song_limit, :string
    add_column :playlists, :song_limit, :integer
  end
end
