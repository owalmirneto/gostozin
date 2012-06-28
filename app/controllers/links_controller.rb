# encoding: utf-8
class LinksController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :get_more]

  before_filter :can_do, :only => [:update, :edit, :destroy]

  before_filter :more_link, :only => [:index, :get_more]

  def index
    respond_with @links
  end

  def get_more
  end

  def show
    @link = Link.find(params[:id])
    respond_with @link
  end

  def edit
  end

  def update
    if @link.update_attributes(params[:link])
      self.save_tags(@link)
      flash[:notice] = "Link foi altualizado com sucesso." 
    end
    respond_with @link, :location => "/u/#{current_user.username}"
  end

  def new
    @link = Link.new
    @link.is_public = true
    respond_with @link
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      self.save_tags(@link)
      flash[:notice] = "Link foi adicionado com sucesso." 
    end
    respond_with @link, :location => edit_link_path(@link)
  end

  def destroy
    @link.destroy
    respond_with @link, :location => "/u/#{current_user.username}"
  end

  protected
    def can_do
      @link = Link.find(params[:id])
      redirect_to links_path if @link.user_id != current_user.id
    end

    def save_tags(link)
      Tag.delete_all("link_id = #{link.id}")
      if link.tag_names.present?
        link.tag_names.split(",").each do |tag|
          Tag.new(link_id: link.id, name: tag).save
        end
      end
    end

    def more_link
      @search = params[:search]

      @links = Link.scoped
      @links = @links.get_public
      @links = @links.by_user(@user) if @user
      @links = @links.by_tag(params[:tag]) if params[:tag]
      @links = @links.search(@search) if @search
      
      @links = @links.paginate(:page => params[:page]) if @search
      @links = @links.paginate(:page => params[:page], :per_page => 5) unless @search
    end
end
