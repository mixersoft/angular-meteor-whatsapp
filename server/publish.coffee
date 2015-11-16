# publish.coffee
'user strict'

return if !Meteor.isServer

Meteor.publish 'users', ()->
  return Meteor.users.find {}, {
    fields:
      profile: 1
  }

Meteor.publishComposite 'chats', ()->
  return if !this.userId

  return {
    find: ()->
      return Chats.find { userIds: this.userId }
    children: [
      {
        find: (chat)->
          return Messages.find {chatId: chat._id}
      },
      {
        find: (chat)->
          fields = {profile:1}
          return Meteor.users.find(
            { _id: {$in: chat.userIds} },
            {fields: fields}
          )
      }

    ]


  }