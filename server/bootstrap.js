(function() {
  'use strict';
  var bootstrap;

  if (!Meteor.isServer) {
    return;
  }

  bootstrap = function() {
    var chats, messages;
    if (Chats.find().count() === 0) {
      Messages.remove({});
      messages = [
        {
          text: 'You on your way?',
          timestamp: moment().subtract(1, 'hours').toDate()
        }, {
          text: 'Hey, it\'s me',
          timestamp: moment().subtract(2, 'hours').toDate()
        }, {
          text: 'I should buy a boat',
          timestamp: moment().subtract(1, 'days').toDate()
        }, {
          text: 'Look at my mukluks!',
          timestamp: moment().subtract(4, 'days').toDate()
        }, {
          text: 'This is wicked good ice cream.',
          timestamp: moment().subtract(2, 'weeks').toDate()
        }
      ];
      _.each(messages, function(o) {
        var id;
        id = Messages.insert(o);
      });
      chats = [
        {
          name: 'Ben Sparrow',
          picture: 'https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png'
        }, {
          name: 'Max Lynx',
          picture: 'https://avatars3.githubusercontent.com/u/11214?v=3&s=460'
        }, {
          name: 'Adam Bradleyson',
          picture: 'https://pbs.twimg.com/profile_images/479090794058379264/84TKj_qa.jpeg'
        }, {
          name: 'Perry Governor',
          picture: 'https://pbs.twimg.com/profile_images/598205061232103424/3j5HUXMY.png'
        }, {
          name: 'Mike Harrington',
          picture: 'https://pbs.twimg.com/profile_images/578237281384841216/R3ae1n61.png'
        }
      ];
      _.each(chats, function(o, i) {
        var chat, chatId, message;
        message = Messages.findOne({
          chatId: {
            $exists: false
          }
        });
        chat = chats[i];
        chat.lastMessage = message;
        chatId = Chats.insert(chat);
        Messages.update(message._id, {
          $set: {
            chatId: chatId
          }
        });
      });
    }
  };

  Meteor.startup(bootstrap);

}).call(this);
