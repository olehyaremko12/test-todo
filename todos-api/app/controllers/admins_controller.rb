class AdminsController < ActionController::Base

	include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
  
  USER, PASSWORD = 'admin', 'password'
  before_action :authentication_check

  def index
    @users = User.all
  end

  private

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
    end
  end
end
