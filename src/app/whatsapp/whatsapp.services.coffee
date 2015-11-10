# whatsapp.services.coffee
'use strict'

Chats = ($q) ->

  chats = [
    {
      _id: 0,
      name: 'Ben Sparrow',
      picture: 'https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png',
      lastMessage: {
        text: 'You on your way?',
        timestamp: moment().subtract(1, 'hours')
      }
    },
    {
      _id: 1,
      name: 'Max Lynx',
      picture: 'https://avatars3.githubusercontent.com/u/11214?v=3&s=460',
      lastMessage: {
        text: 'Hey, it\'s me',
        timestamp: moment().subtract(2, 'hours')
      }
    },
    {
      _id: 2,
      name: 'Adam Bradleyson',
      picture: 'https://pbs.twimg.com/profile_images/479090794058379264/84TKj_qa.jpeg',
      lastMessage: {
        text: 'I should buy a boat',
        timestamp: moment().subtract(1, 'days')
      }
    },
    {
      _id: 3,
      name: 'Perry Governor',
      picture: 'https://pbs.twimg.com/profile_images/598205061232103424/3j5HUXMY.png',
      lastMessage: {
        text: 'Look at my mukluks!',
        timestamp: moment().subtract(4, 'days')
      }
    },
    {
      _id: 4,
      name: 'Mike Harrington',
      picture: 'https://pbs.twimg.com/profile_images/578237281384841216/R3ae1n61.png',
      lastMessage: {
        text: 'This is wicked good ice cream.',
        timestamp: moment().subtract(2, 'weeks')
      }
    }
  ]
  self = {
    all: () ->
      return chats
    remove: (chat)->
      chats.splice(chats.indexOf(chat), 1)
    get: (chatId)->
      found = _.find chats, {'_id': parseInt(chatId) }
      return null if !found
      return found
  }
  return self


Chats.$inject = ['$q']

angular.module 'whatsapp.services'
  .factory 'Chats', Chats