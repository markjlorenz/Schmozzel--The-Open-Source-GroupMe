class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

private
  def authenticate
    authenticate_or_request_with_http_basic do |id, password| 
      id == 'soodesune' && password == 'novirus'
    end
  end

end
