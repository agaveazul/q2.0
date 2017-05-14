class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please Log In"
      redirect_to new_session_path
    end
  end

end
