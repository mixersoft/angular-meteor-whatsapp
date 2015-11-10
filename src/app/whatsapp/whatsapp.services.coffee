# whatsapp.services.coffee
'use strict'

Chats = new Mongo.Collection('chats')
Messages = new Mongo.Collection('messages')


angular.module 'whatsapp.services'
  .value 'Chats', Chats
  .value 'Messages', Messages