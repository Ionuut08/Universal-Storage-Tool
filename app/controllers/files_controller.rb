class FilesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]
  def index
    #actually the main page
  end

  def show;
  end

  def new
    @drive_file = DriveFile.new
  end

  def create
    @drive_file = DriveFile.create(file_params.merge(user: current_user))
    begin
      $session.upload_from_file(@drive_file.path, @drive_file.name, convert: false)
    rescue Errno::ENOENT
    end
    redirect_to users_path
  end

  def edit;
  end

  def download_file
    file_name = params[:file_name]
    @drive_file = $session.file_by_title(file_name)
    @drive_file.download_to_file("/Users/mihnea.voronca/Desktop/#{file_name}")
    redirect_to users_path
  end

  def destroy
    file_name = params[:file_name]
    @drive_file = $session.file_by_title(file_name)
    if params[:permanent].present?
      @drive_file.delete(permanent = true)
      @drive_file = DriveFile.where(name: file_name).first
      @drive_file.delete
    else
      @drive_file.delete(permanent = false)
      @drive_file = DriveFile.where(name: file_name).first
      @drive_file.is_deleted = true
      @drive_file.save
    end
    redirect_to users_path
  end

  def restore
    file_name = params[:file_name]
    @drive_file = DriveFile.where(name: file_name).first
    @drive_file.is_deleted = false
    @drive_file.save
    redirect_to users_path
  end

  def add_file

  end

  def post_file

  end

  def home;
  end

  private

  def file_params
    params.require(:drive_file).permit(:path, :name)
  end

  def drive_file
    @drive_file ||= DriveFile&.find(params[:id])
  end
end
