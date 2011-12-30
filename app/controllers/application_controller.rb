require 'digest'
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate, except:[:mobile, :home]

private
  def authenticate
    authenticate_or_request_with_http_basic do |id, password| 
      id == 'admin' && Digest::MD5.hexdigest(password) == "75007cbaca213d3df9010b3ef217f176" #hint: no so secure password
    end
  end

end
