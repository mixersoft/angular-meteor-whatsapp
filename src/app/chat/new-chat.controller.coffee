# login.controller.coffee
'use strict'

NewChatCtrl = ($scope, $meteor, $state)->
  $scope.$meteorSubscribe('users')
  .then ()->
    $scope.users = $scope.$meteorCollection ()->
      return Meteor.users.find {
        _id:
          $ne: Meteor.userId()
      }
    , false
    return $scope.users

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

    $meteor.call( 'newChat', userId )
    .then (chatId)->
      gotoChat(chatId)
      return chatId

  gotoChat = (chatId)->
    $scope.hideModal()
    $state.go('tab.chat-detail', {chatId: chatId} )



NewChatCtrl.$inject = ['$scope', '$meteor', '$state']

angular.module 'starter.chat'
  .controller 'NewChatCtrl', NewChatCtrl