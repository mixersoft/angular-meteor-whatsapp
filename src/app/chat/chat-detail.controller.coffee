'use strict'

ChatDetailCtrl = ($log, $scope, $stateParams, $timeout, $ionicScrollDelegate, $meteor) ->
  $log.info "Creating ChatDetailCtrl"

  $scope.chat = $scope.$meteorObject(Chats, $stateParams.chatId, false)

  $scope.messages = $scope.$meteorCollection ()->
    return Messages.find { chatId: $stateParams.chatId}
  , false

  $scope.inputUp = ()->
    $timeout ()->
      $ionicScrollDelegate.$getByHandle('chatScroll').scrollBottom(true)
      return
    , 300
    return

  $scope.inputDown = ()->
    $ionicScrollDelegate.$getByHandle('chatScroll').resize()
    return

  $scope.sendMessage = ()->
    return if _.isEmpty $scope.data.message

    $meteor.call 'newMessage', {
      text: $scope.data.message
      chatId: $stateParams.chatId
    }

    delete $scope.data.message
    return





ChatDetailCtrl.$inject = ['$log', '$scope', '$stateParams',  '$timeout'
'$ionicScrollDelegate', '$meteor'
]

angular.module 'starter.chat'
  .controller 'ChatDetailCtrl', ChatDetailCtrl
