class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :enable_cors
  # before_action :client_auth
  before_action :set_default_format
  rescue_from ActiveRecord::RecordNotFound, with: :respond_record_not_found


  def error_404
    respond_error messages: "/#{params[:unmatched_route]} not found", status: 404
  end

  private

  def enable_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport, X-Remote, api_key, auth_token, *'
    response.headers['Access-Control-Request-Method'] = 'GET, POST, PUT, DELETE'
    response.headers['Access-Control-Request-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X- Cache-Date, Content-Type, X-Atmosphere-Transport, X-Remote, api_key, *'
  end

  def respond_record_not_found(e)
    respond_error(messages: e.message, status: 404, debug: e.backtrace)
  end

  # def client_auth
  #   respond_error unless request.headers.to_h["HTTP_X_TOKEN"] == "123456"
  # end

  def set_default_format
    request.format = 'json'
  end
  
end
