class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  has_many :messages, dependent: :destroy
  
  validates_uniqueness_of :sender_id, scope: :receiver_id

  #check user is already in conversation table or not
  scope :between, -> (sender_id, receiver_id) do
    where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)", sender_id, receiver_id, sender_id, receiver_id)
  end
  
#check recipient 
  def recipient(current_user)
    self.sender_id == current_user.id ? self.receiver : self.sender
  end

  #count unread message
  def unread_message_count(current_user)
    self.messages.where("user_id != ? AND read = ?", current_user.id, false).count
  end

  def last_message(conversation_id)
    self.messages.where("conversation_id", conversation_id).last
  end
end

