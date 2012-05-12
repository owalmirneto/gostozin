class UsersController < ApplicationController
  def links
    @user = User.find_by_username(params[:username]) 
    redirect_to links_path unless @user

    @links = Link.paginate(page: params[:page], conditions: ["user_id = ?", @user.id]) if @user
  end
end