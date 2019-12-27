class ApplicationController < ActionController::Base

  private

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user # This makes it available to all views also.

    def require_signin
      unless current_user
        session[:intended_url] = request.url
        redirect_to new_session_path
      end
    end

    def current_user?(user)
      current_user.id == user.id
    end

    helper_method :current_user?

end
