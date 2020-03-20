class UsersController < ApplicationController
  require "googleauth"

  def index
    #actually the main page
    $session = GoogleDrive::Session.from_service_account_key("client_secret.json")
    @session = $session
  end

  def show;
  end

  def new
    # @user = User.new
  end

  def edit;
  end


  def home;
  end

  private

  def file_params
    params.require(:drive_file).permit(:path, :name)
  end

  def user
    # @user ||= User.find(params[:id])
  end

  def drive_file
    @drive_file ||= DriveFile&.find(params[:id])
  end

  def session
    # @session ||= GoogleDrive::Session.from_service_account_key("client_secret.json")
  end
end
