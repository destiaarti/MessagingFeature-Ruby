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


end
