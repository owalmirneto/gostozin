class LinksController < ApplicationController
  
  before_filter :authenticate_user!, :except => :index

  before_filter :can_do, :only => [:update, :edit, :destroy]

  before_filter :link_for_form

  def index
    @search = params[:search]

    @links = Link.scoped
    @links = @links.get_public
    @links = @links.by_tag(params[:tag]) if params[:tag]
    @links = @links.paginate(page: params[:page])
    respond_with @links
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

    def link_for_form
      @link_for_form = Link.new
      @link_for_form.is_public = true
    end
end
