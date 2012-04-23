class UsersController < ApplicationController
  def index
    @user = User.first
  end

  def links
    @user = User.find_by_username params[:username]
  end
end