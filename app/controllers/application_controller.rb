class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session

  before_action :authenticate_if_not_local

  private

    def authenticate_if_not_local
    #if Rails.env == 'production' && request.remote_addr !~ /^192.168.0.\d{1,3}$/
    if request.remote_addr !~ /^192.168.0.\d{1,3}$/
      authenticate_or_request_with_http_basic 'Production' do |name, password|
        name == 'user' && password == 'Dolina2020'
      end
    end
  end
end
