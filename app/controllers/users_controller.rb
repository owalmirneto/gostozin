class UsersController < ApplicationController
  def links
    @user = User.find_by_username params[:username]
  end
end