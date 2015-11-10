# whatsapp.services.coffee
'use strict'

meteorRun = ($window)->

  #  declare Mongo Collections globally
  global = {
    Chats: new Mongo.Collection('chats')
    Messages: new Mongo.Collection('messages')
  }

  _.extend $window, global
  return

meteorRun.$inject = ['$window']

angular.module 'whatsapp.services'
  .run meteorRun
#   .value 'Chats', Chats
#   .value 'Messages', Messages