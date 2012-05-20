class UsersController < ApplicationController

  before_filter :load_resources, :only => [:update_data, :update_pass]

  def links
    @user = User.find_by_username(params[:username])
    redirect_to links_path unless @user
    @links = Link.paginate(page: params[:page], conditions: ["user_id = ?", @user.id]) if @user

    respond_with @links do |format|
      format.atom
    end
  end

  def update_data
    flash[:notice] = 'Seus dados foram altualizado com sucesso.' if @user.update_attributes(params[:user])
    redirect_to "/u/#{current_user.username}/edit"
  end

  def update_pass
    save = @user.update_attributes(params[:user]) if can_save_pass
    flash[:notice] = 'Sua senha foi alterada com sucesso.' if save
    redirect_to edit_user_registration
  end

  protected
    def load_resources
      @user = User.find(current_user.id)
    end

    def can_save_pass
      current_user.password == params[:user][:current_password] && params[:user][:password] == params[:user][:password_confirmation]
    end
end