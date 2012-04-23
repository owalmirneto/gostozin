class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :json, :html, :xml
end
