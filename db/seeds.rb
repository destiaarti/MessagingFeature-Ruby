
#seeder user
User.create(name:'userA', password:'toy', email:"userA@mail.com")
User.create(name:'userB', password:'toy', email:"userB@mail.com")
User.create(name:'userC', password:'toy', email:"userC@mail.com")
User.create(name:'userD', password:'toy', email:"userD@mail.com")

#seeder Conversation
Conversation.create(senderid:1, receiver_id:2)
Conversation.create(senderid:1, receiver_id:4)
Conversation.create(senderid:3, receiver_id:1)
Conversation.create(senderid:3, receiver_id:2)
Conversation.create(senderid:3, receiver_id:4)

#seeder A-B
Message.create(body:'hi', conversation_id:1, read:1, user_id:1)
Message.create(body:'hi too', conversation_id:1, read:1, user_id:2)
Message.create(body:'whats up?', conversation_id:1, read:1, user_id:2)
Message.create(body:'good', conversation_id:1, read:0, user_id:1)
Message.create(body:'if you?', conversation_id:1, read:0, user_id:1)

#seeder A-C
Message.create(body:'yoloo', conversation_id:2, read:1, user_id:1)
Message.create(body:'yeyyy', conversation_id:2, read:1, user_id:4)

#seeder A-D
Message.create(body:'morning', conversation_id:3, read:0, user_id:3)
Message.create(body:'.....', conversation_id:3, read:0, user_id:3)
Message.create(body:'.....', conversation_id:3, read:0, user_id:3)