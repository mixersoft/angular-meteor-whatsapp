# stubs.coffee
'use strict'


Meteor.methods {
  newMessage: (message)->
    check message, {
      text: String
      chatId: String
    }

    message.timestamp = new Date()

    messageId = Messages.insert(message)
    Chats.update message.chatId, {
      $set: { lastMessage: message }
    }
    return messageId
}