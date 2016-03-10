'use strict'
# @ adds to global namespace
global = @

options = {
  'messages':
    limit: 10
}

class ChatModel
  constructor: (chat)->
    _.extend(@, chat)

  isAdmin: (userId)=>
    userId ?= Meteor.userId()
    return true if @ownerId == userId
    return false



global['Chats'] = Chats = new Mongo.Collection('chats', {
  transform: (chat)->
    result = new ChatModel(chat)
    return result
})

allow = {
  insert: (userId, chat)->
    return chat.ownerId? # userId && chat.ownerId == userId
  update: (userId, chat, fields, modifier)->
    return userId && chat.ownerId == userId
  remove: (userId, chat)->
    return userId && chat.ownerId == userId
}


methods = {
}


global['Chats'].allow allow
Meteor.methods methods
