class Api::V1::ConversationsController < ApplicationController
  before_action :authenticate_user!

  #view list conversation current_user with other user with last message
  def index
   
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @conversation1 = @conversations.includes(:messages).references(:messages).order('messages.created_at DESC')
   @user = @conversation1.includes(:receiver).references(:receiver).includes(:sender).references(:sender)
.select("conversations.id,conversations.sender_id,conversations.receiver_id,messages.id, messages.conversation_id, messages.user_id, messages.body
   ,users.name,users.email,users.id")
    
render :json => @user 
end

#make new conversation
  def create
    #check current_user has already have chat with receiver 
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

   render json: @conversation
  end

  
  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end
end
