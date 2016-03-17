# login.controller.coffee
'use strict'

NewChatCtrl = ($scope, $reactive, $state)->
  # $reactive(this).attach($scope)

  $scope.subscribe 'chats'

  $scope.helpers {
    'users': ()->
      return Meteor.users.find {
        _id:
          $ne: Meteor.userId()
      }
  }

  $scope.hideModal = ()->
    $scope.modal.hide()
    return

  $scope.newChat = (userId)->
    chat = Chats.findOne {
      type: 'chat'
      userIds: {
        $all: [Meteor.userId(), userId]
      }
    }
    return gotoChat(chat._id) if chat

    $reactive.call( 'newChat', userId )
    .then (chatId)->
      gotoChat(chatId)
      return chatId

  gotoChat = (chatId)->
    $scope.hideModal()
    $state.go('tab.chat-detail', {chatId: chatId} )



NewChatCtrl.$inject = ['$scope', '$reactive', '$state']

angular.module 'starter.chat'
  .controller 'NewChatCtrl', NewChatCtrl