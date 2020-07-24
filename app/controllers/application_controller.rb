class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session

  before_action :authenticate_if_not_local

  private

    def authenticate_if_not_local
    puts "====================================================="
    puts "Remote_addr #{request.remote_ip}"
    puts "====================================================="
    #if Rails.env == 'production' && request.remote_addr !~ /^192.168.0.\d{1,3}$/
    #if request.remote_addr !~ /^192.168.0.\d{1,3}$/ || request.remote_addr !~ /^31.128.72.125$/ || request.remote_addr !~ /^95.46.157.148$/
    if request.remote_ip !~ /^192.168.0.\d{1,3}$/ || request.remote_ip !~ /^31.128.72.125$/ || request.remote_ip !~ /^95.46.157.148$/
      authenticate_or_request_with_http_basic 'Production' do |name, password|
        name == 'user' && password == 'Dolina2020'
      end
    end
  end
end
