# filter.chatName.coffee
'use strict'

chatName = ()->
  return (chat)->
    return if !chat

    otherId = _.without( chat.userIds, Meteor.userId() )[0]
    otherUser = Meteor.users.findOne otherId
    return hasName = otherUser?.profile?.name || 'PLACE HOLDER'


angular.module 'starter.chat'
  .filter 'chatName', chatName