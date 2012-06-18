class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :json, :html, :xml

  before_filter :link_for_form

  protected
    def link_for_form
      @link_for_form = Link.new
    end
end
