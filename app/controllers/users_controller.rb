class UsersController < ApplicationController

  before_filter :authenticate_user!, :except => :links

  before_filter :load_resources, :except => [:links]

  before_filter  :link_for_form

  def links
    @user = User.find_by_username(params[:username])
    redirect_to links_path unless @user

    @links = Link.scoped
    @links = @links.get_public unless user_signed_in?
    @links = @links.by_user(@user) if @user
    @links = @links.paginate(page: params[:page])

    respond_with @links
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

    def link_for_form
      @link_for_form = Link.new
    end
end