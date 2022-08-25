class MessagesController < ApplicationController
  before_action :set_message, only: [:update, :edit]
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @consultation = Consultation.find(params[:consultation_id])
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    # @consultation = Consultation.find(params[:consultation_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    # @message.consultation = @consultation
    @message.user = current_user
    if @message.save
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
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
