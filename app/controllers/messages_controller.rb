class MessagesController < ApplicationController
  before_action :set_message, only: [:update, :edit]
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit; end

  def update
    @message.update(message_params)
    redirect_to message_path(@message)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
