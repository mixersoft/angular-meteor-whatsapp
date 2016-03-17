'use strict'

ChatDetailCtrl = ($log, $scope, $stateParams, $timeout, $ionicScrollDelegate, $reactive) ->
  $log.info "Creating ChatDetailCtrl"
  # $reactive(this).attach($scope)

  isIOS = ionic.Platform.isWebView() && ionic.Platform.isIOS()

  $scope.helpers {
    'chat': ()->
      return Chats.findOne($stateParams.chatId)
    'messages': ()->
      return Messages.find({ chatId: $stateParams.chatId })
  }

  $scope.inputUp = ()->
    $scope.data.keyboardHeight = 216 if isIOS

    $timeout ()->
      $ionicScrollDelegate.$getByHandle('chatScroll').scrollBottom(true)
      return
    , 300
    return

  $scope.inputDown = ()->
    $scope.data.keyboardHeight = 0 if isIOS

    $ionicScrollDelegate.$getByHandle('chatScroll').resize()
    return

  $scope.closeKeyboard = ()->
    # // cordova.plugins.Keyboard.close();
    return

  $scope.sendMessage = ()->
    return if _.isEmpty $scope.data.message

    Meteor.call 'newMessage', {
      text: $scope.data.message
      type: 'text'
      chatId: $scope.chat._id
    }

    delete $scope.data.message
    return

  $scope.sendPicture = ()->
    # get base64 DATA_URI from ngCordova Camera
    data = ""  # base64 DATA_URI
    Meteor.call('newMessage', {
      picture: data,
      type: 'picture',
      chatId: $scope.chat._id
    })
    return





ChatDetailCtrl.$inject = ['$log', '$scope', '$stateParams',  '$timeout'
'$ionicScrollDelegate', '$reactive'
]

angular.module 'starter.chat'
  .controller 'ChatDetailCtrl', ChatDetailCtrl
