class ApplicationController < ActionController::Base

  private

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user # This makes it available to all views also.

    def current_user_admin?
      current_user && current_user.admin?
    end

    helper_method :current_user_admin?

    def require_signin
      unless current_user
        session[:intended_url] = request.url
        redirect_to new_session_path
      end
    end

    def require_admin
      unless current_user_admin?
        redirect_to events_url
      end
    end

    def current_user?(user)
      current_user.id == user.id
    end

    helper_method :current_user?

end
