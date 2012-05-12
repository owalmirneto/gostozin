class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => :index

  def index
    @links = Link.all
    respond_with @links
  end

  def show
    @link = Link.find(params[:id])
    respond_with @link
  end

  def new
    @link = Link.new
    respond_with @link
  end

  def edit
    @link = Link.find(params[:id])
  end

  def create
    @link = Link.new(params[:link])

    flash[:notice] = 'Link foi adicionado com sucesso.' if @link.save
    respond_with @link, :location => links_path
  end

  def update
    @link = Link.find(params[:id])

    flash[:notice] = 'Link foi altualizado com sucesso.' if @link.update_attributes(params[:link])
    respond_with @link, :location => edit_link_path(@link)
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_with @link, :location => links_path
  end
end
