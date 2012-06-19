# encoding: utf-8
class FeedbacksController < ApplicationController
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
      flash[:notice] = 'Todos os campos são obrigatórios, por favor preencha'
    end
    respond_with @feedback, :location => root_path
  end
end
