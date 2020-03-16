class UsersController < ApplicationController
  require "googleauth"

  def index
    # @users = User.all
    @session = GoogleDrive::Session.from_service_account_key("client_secret.json")



  end

  def show
  end

  def new
    # @user = User.new
  end

  def edit; end

  def update
    #if @user.update(user_params)
      # flash[:success] = "Your account was updated successfully"
    #  respond_with(@thing, location: users_path)
    #else
    # render "edit"
    #end
  end

  def home; end

  private

  def user
    # @user ||= User.find(params[:id])
  end

  def user_params
    # params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
