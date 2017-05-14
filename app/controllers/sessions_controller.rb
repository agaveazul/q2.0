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
      if user.activated?
        log_in user
        params[:remember_me] == '1' ? remember(user) : forget(user)
        session[:user_id] = user.id
        redirect_back_or user
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email or password!"
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
