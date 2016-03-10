'use strict'
# @ adds to global namespace
global = @

options = {
}

class MessageModel
  constructor: (message)->
    _.extend(@, message)

  isAdmin: (userId)=>
    userId ?= Meteor.userId()
    return true if @ownerId == userId
    return false

global['Messages'] = Messages = new Mongo.Collection('messages', {
  transform: (message)->
    result = new MessageModel(message)
    return result
})

allow = {
  insert: (userId, message)->
    return message.ownerId? # userId && message.ownerId == userId
  update: (userId, message, fields, modifier)->
    return userId && message.ownerId == userId
  remove: (userId, message)->
    return userId && message.ownerId == userId
}


methods = {
}


global['Messages'].allow allow
Meteor.methods methods
