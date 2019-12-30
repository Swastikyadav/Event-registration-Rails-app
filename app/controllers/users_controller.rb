class UsersController < ApplicationController

  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @registrations = @user.registrations
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to  new_session_path
    else
      render :new
    end
  end

  def edit
    # @user = User.find(params[:id])
    # User will be already set by require_correct_user method as it runs before edit
  end

  def update
    # @user = User.find(params[:id])
    # User will be already set by require_correct_user method as it runs before edit
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    # @user = User.find(params[:id])
    # User will be already set by require_correct_user method as it runs before edit
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user)
        .permit(:name, :email, :password, :password_confirmation)
    end

    def require_correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        redirect_to events_url
      end
    end

end
