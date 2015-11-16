'use strict'

ChatsCtrl = ($log, $scope, $ionicModal, $meteor, exportDebug) ->
  $log.info "Creating ChatsCtrl"
#	  With the new view caching in Ionic, Controllers are only called
#	  when they are recreated or on app start, instead of every page change.
#	  To listen for when this page is active (for example, to refresh data),
#	  listen for the $ionicView.enter event:
#
#	  $scope.$on '$ionicView.enter', (e) ->

  $scope.chats = $scope.$meteorCollection(Chats)

  $ionicModal.fromTemplateUrl('chat/new-chat.html', {
    scope: $scope
    })
  .then (modal)->
    $scope.modal = modal

  $scope.$on '$destroy', ()->
    $scope.remove()
    return

  $scope.openNewChatModal = ()->
    $scope.modal.show()
    return

  $scope.remove = (chat) ->
    # $scope.chats.remove(chat)
    $meteor.call 'removeChat', chat._id # secure remove from server
    return


  exportDebug.set 'Chats', Chats # reference global MongoColletion
    
  return

ChatsCtrl.$inject = ['$log', '$scope', '$ionicModal', '$meteor', 'exportDebug']

angular.module 'starter.chat'
  .controller 'ChatsCtrl', ChatsCtrl
