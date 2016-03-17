# filter.chat-picture.coffee
'use strict'

chatPicture = ()->
  return (chat)->
    return if !chat
    if !chat.userIds
      # demo data
      return hasPicture = chat.picture
    otherId = _.without( chat.userIds, Meteor.userId() )[0]
    otherUser = Meteor.users.findOne otherId
    return hasPicture = otherUser?.profile?.picture || '/img/user-default.svg'


angular.module 'starter.chat'
  .filter 'chatPicture', chatPicture