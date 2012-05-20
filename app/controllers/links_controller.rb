class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => :index

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
    @link = Link.find(params[:id])
    self.can_update(@link)
  end

  def update
    @link = Link.find(params[:id])
    self.can_update(@link)

    if @link.update_attributes(params[:link])
      self.save_tags(@link)
      flash[:notice] = 'Link foi altualizado com sucesso.' 
    end
    respond_with @link, :location => links_path
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
      flash[:notice] = 'Link foi adicionado com sucesso.' 
    end
    respond_with @link, :location => links_path
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    respond_with @link, :location => links_path
  end

  protected
    def can_update(link)
      redirect_to links_path if link.user_id != current_user.id
    end

    def save_tags(link)
      Tag.delete_all("link_id = #{@link.id}")
      @link.tag_names.split(",").each do |tag|
        Tag.new(link_id: @link.id, name: tag).save
      end
    end
end
