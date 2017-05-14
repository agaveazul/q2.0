class SessionsController < ApplicationController
  include SessionsHelper
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
      params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user_path(user.id)
    else
      flash.now[:alert] = "Invalid email or password!"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  def view
    @playlist_q = Playlist.find(params[:id])
    @songs = SuggestedSong.playlist_songs(@playlist_q.id)
    @songs.each do |song|
      song.update_attribute(:status, "que")
    end
  end

end
