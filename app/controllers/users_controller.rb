class UsersController < ApplicationController
  require "googleauth"

  def index
    # @users = User.all
    #@session = GoogleDrive::Session.from_service_account_key("client_secret.json")
    binding.pry
    credentials = Google::Auth::UserRefreshCredentials.new(
        client_id: "938174431673-iidiaeh0putgn7mfh41jgd2u2ngike6k.apps.googleusercontent.com",
        client_secret: "-2wA_Zs2KiYU0RZxRtDxOygd",
        scope: [
            "https://www.googleapis.com/auth/drive",
            "https://spreadsheets.google.com/feeds/",
        ],
        redirect_uri: "http://localhost:3000/users")
    credentials.code = authorization_code
    credentials.fetch_access_token!
    @session = GoogleDrive::Session.from_credentials(credentials)


  end

  def show
    credentials = Google::Auth::UserRefreshCredentials.new(
        client_id: "938174431673-iidiaeh0putgn7mfh41jgd2u2ngike6k.apps.googleusercontent.com",
        client_secret: "-2wA_Zs2KiYU0RZxRtDxOygd",
        scope: [
            "https://www.googleapis.com/auth/drive",
            "https://spreadsheets.google.com/feeds/",
        ],
        redirect_uri: "http://localhost:3000/users")
    auth_url = credentials.authorization_uri
    redirect_to auth_url.to_s

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
