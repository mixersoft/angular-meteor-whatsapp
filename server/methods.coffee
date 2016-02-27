#methods.coffee
'use strict'

Meteor.methods {
  newMessage: (message)->
    if !this.userId
      throw new Meteor.Error('not-logged-in', 'Must be logged to send a message.')

    check message, Match.OneOf( {
      text: String,
      type: String,
      chatId: String
    },
    {
      picture: String,
      type: String,
      chatId: String
    })

    message.timestamp = new Date()
    message.userId = this.userId

    messageId = Messages.insert(message)
    Chats.update message.chatId, {
      $set: { lastMessage: message }
    }
    return messageId

  updateName: (name)->
    if not this.userId
      throw new Meteor.Error('not-logged-in', 'Must be logged to update profile.')

    check name, String
    throw Meteor.Error('name-required', 'Must provide user name') if name.length == 0

    return Meteor.users.update(this.userId, { $set: { 'profile.name': name } })

  updatePicture: (data)->
    if not this.userId
      throw new Meteor.Error 'not-logged-in', 'Must be logged in to update his picture.'

    check data, String
    return Meteor.users.update( this.userId, { $set: { 'profile.picture': data } })


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

  # made secure by: `meteor remove insecure`
  removeChat: (chatId)->
    if !this.userId
      throw new Meteor.Error('not-logged-in', 'Must be logged to create a chat.')

    check chatId, String
    chat = Chats.findOne chatId
    if !chat || !_.include(chat.userIds, this.userId)
      throw new Meteor.Error 'chat-not-exists', 'Chat does not exist'

    Messages.remove {chatId: chatId}
    return Chats.remove {_id: chatId}




}