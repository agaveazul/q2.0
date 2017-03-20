class SessionsController < ApplicationController
  layout "login"

  def new
  end

  def destroy
  end

  def frontpage
    @public_playlists = []
    @public_playlists << Playlist.find(1)
    @public_playlists << Playlist.find(2)
    @public_playlists << Playlist.find(3)
    @public_playlists << Playlist.find(4)
    render :layout => 'alternative'
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: "Logged In!"
    else
      flash.now[:alert] = "Invalid email or password!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  def view
    @playlist_q = Playlist.find(params[:id])
    @songs = SuggestedSong.playlist_songs(@playlist_q.id)
    @songs.each do |song|
      song.update_attribute(:status, "que")
    end
  end

end
