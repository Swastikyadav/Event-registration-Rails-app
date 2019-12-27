class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      # put user in session
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user_path(user))
      session[:intended_url] = nil
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
