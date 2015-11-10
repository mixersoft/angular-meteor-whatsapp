'use strict'

ChatDetailCtrl = ($log, $scope, $stateParams, Chats) ->
  $log.info "Creating ChatDetailCtrl"

  $scope.chat = $scope.$meteorObject(Chats, $stateParams.chatId, false)

ChatDetailCtrl.$inject = ['$log', '$scope', '$stateParams', 'Chats']

angular.module 'starter.chat'
  .controller 'ChatDetailCtrl', ChatDetailCtrl
