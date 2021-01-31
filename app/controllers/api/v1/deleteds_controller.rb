class Api::V1::DeletedsController < ApplicationController
  before_action :authenticate_user!


  #delete message
  def message
    @message = Message.where('user_id = ?', current_user.id) 
    begin
  
   @message_delete = Message.where('id = ? AND user_id = ?', params[:id].split(','), current_user.id)
   @message_delete.destroy_all
    render json: @message
  rescue => e 
    render json: {
      messages: "Something wrong",
      is_success: false,
      data: {}
    }, status: :unprocessable_entity
  end
end

  #delete conversation
  def conversation
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
   
    @delete = @conversations.destroy(params[:id].split(','))
   
    

   

    render json: @conversations
  
end

end
