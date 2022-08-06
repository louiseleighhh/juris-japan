class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @consultation = Consultation.find(params[:consultation_id])
  end

  def create
    @message = Message.new(message_params)
    @user = current_user
    @message.user = @user
    @consultation = Consultation.find(params[:consultation_id])
    @message.consultation = @consultation
    if @message.save
      redirect_to message_path(@message)
      # Not sure about the routes here
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
