class FeedbacksController < ApplicationController
  before_filter :link_for_form
  
  def index
    @feedbacks = Feedback.all
    respond_with @feedbacks
  end

  def about
  end

  def new
    @feedback = Feedback.new
    respond_with @feedback
  end

  def create
    @feedback = Feedback.new(params[:feedback])

    if @feedback.save
      flash[:notice] = 'Sua mensagem foi enviada com sucesso.<br />Em breve entraremos em contato.'.html_safe
    else
      flash[:notice] = 'Todos os campos s&atilde;o obrigat&oacute;rios, por favor preencha'.html_safe
    end
    respond_with @feedback, :location => root_path
  end

  protected
    def link_for_form
      @link_for_form = Link.new
    end
end
