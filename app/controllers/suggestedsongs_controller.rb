class SuggestedsongsController < ApplicationController
  def new
    @suggested_song = SuggestedSong.new
  end

 def create
    @suggested_song = SuggestedSong.new(song_id: params[:song_id], user_id: session[:user_id] , playlist_id: params[:playlist_id], name: params[:name])
    # @suggested_song.user_id = session[:user_id]

    @suggested_song.save
    # if request.xhr?
    #   respond_to do |format|
    #   format.json render json: @suggested_song
    #   end
    # end

 end

 def index

   @playlist_q = Playlist.find(params[:playlist_id])

   response = HTTParty.get("https://connect.deezer.com/oauth/access_token.php?app_id=#{ENV["deezer_application_id"]}&secret=#{ENV["deezer_secret_key"]}&code=#{params[:code]}&output=json")

   access_token = response["access_token"]
   @albums = HTTParty.get("http://api.deezer.com/search/album?q=#{params[:search]}&#{access_token}")
   @tracks = HTTParty.get("http://api.deezer.com/search/track?q=#{params[:search]}&#{access_token}")
   @artists = HTTParty.get("http://api.deezer.com/search/artist?q=#{params[:search]}&#{access_token}")
 end

 def destroy
    @suggested_song = SuggestedSong.find(params[:id])
    @suggested_song.destroy
  end

end
