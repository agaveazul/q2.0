class UsersController < ApplicationController
  layout "signup"

  def deezer
     response = HTTParty.get("https://connect.deezer.com/oauth/access_token.php?app_id=#{ENV["deezer_application_id"]}&secret=#{ENV["deezer_secret_key"]}&code=#{params[:code]}&output=json")
     access_token = response["access_token"]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      SendinblueMailer.account_confirmation_email(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def index
  end

  def show
    hosted_auths = Authorization.where(user_id: session[:user_id], status: "Host")
    @hosted = []
    hosted_auths.each do |auth|
      @hosted << auth.playlist if auth.playlist
    end

    guest_auths = Authorization.where(user_id: session[:user_id], status: "Guest").or(Authorization.where(user_id: session[:user_id], status: "Forbidden"))
    @guest = []
    guest_auths.each do |auth|
      @guest << auth.playlist if auth.playlist
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
