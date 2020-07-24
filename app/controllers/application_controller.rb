class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session

  before_action :authenticate_if_not_local

  private

  def authenticate_if_not_local
    remote_ip = request.remote_ip
    if Rails.env == 'production'
      if remote_ip == "31.128.72.125" || remote_ip == "95.46.157.148"
        skip_authentication
      elsif remote_ip !~ /^192.168.0.\d{1,3}$/
        basic_auth_method
      end
    end
  end

  def skip_authentication
  end

  def basic_auth_method
    authenticate_or_request_with_http_basic 'Auth' do |name, password|
      name == 'user' && password == 'Dolina2020'
    end
  end
end
