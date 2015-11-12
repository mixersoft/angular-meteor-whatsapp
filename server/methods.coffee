#methods.coffee
'use strict'

Meteor.methods {
  newMessage: (message)->
    if !this.userId
      throw new Meteor.Error('not-logged-in', 'Must be logged to send a message.')

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

  updateName: (name)->
    if !this.userId
      throw new Meteor.Error('not-logged-in', 'Must be logged to update profile.')

    check name, String
    throw Meteor.Error('name-required', 'Must provide user name') if name.length == 0

    return Meteor.users.update(this.userId, { $set: { 'profile.name': name } })


}