# stubs.coffee
'use strict'


Meteor.methods {
  newMessage: (message)->
    check message, {
      text: String
      chatId: String
    }

    message.timestamp = new Date()
    message.userId = this.userId

    messageId = Messages.insert(message)
    Chats.update message.chatId, {
      $set: { lastMessage: message }
    }
    return messageId

  newChat: (otherId)->
    if ! this.userId
      throw new Meteor.Error 'not-logged-in', "Must be logged in to create a chat."

    check otherId, String

    otherUser = Meteor.users.findOne otherId
    if !otherUser
      throw new Meteor.Error 'user-not-exists', "Chat's user does not exist"

    chat = {
      userIds: [this.userId, otherId]
      createdAt: new Date()
    }

    return Chats.insert chat

  removeChat: (chatId)->
    check chatId, String
    Messages.remove {chatId: chatId}
    return Chats.remove {_id: chatId}
}