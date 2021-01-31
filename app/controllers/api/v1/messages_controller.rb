class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  #view message current user with other
  def index
    @messages = @conversation.messages
    begin
    @update = @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)
    @message = @conversation.messages.new
    render json: @messages
  rescue => e 
    render json: @messages
  end
  end

  #make new message
  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      render json: @conversation.messages
    end
  end



  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end
