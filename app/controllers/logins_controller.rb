class LoginsController < ApplicationController
  skip_before_action :authenticate_user!, except: :logout
  skip_before_action :verify_authenticity_token

  def new
    redirect_to users_path # if current_user
  end

  def create
    # user = authenticate_with_google
    # if user
    #   sign_in user
      redirect_to users_path
  #   else
  #     raise ActionController::RoutingError, 'Forbidden'
  #   end
  # end

  def logout
    # sign_out current_user
    redirect_to root_path
  end

  private

  def authenticate_with_google
    # if id_token = flash[:google_sign_in_token]
    #   google_token = GoogleSignIn::Identity.new(id_token)
    #   user = User.where(google_id: google_token.user_id).first
    #   if user
    #     user.update(formatted_google_params(google_token))
    #     $session = GoogleDrive::Session
                       .login_with_oauth(google_token)
  #       user
  #     else
  #       User.create(formatted_google_params(google_token))
  #     end
  #   elsif error = flash[:google_sign_in][:error]
  #     logger.error "Google authentication error: #{error}"
  #     nil
  #   end
  # end

  def formatted_google_params(token)
    {
        google_id: token.user_id,
        email: token.email_address,
        name: token.name,
        avatar_url: token.avatar_url
    }
  end
end
