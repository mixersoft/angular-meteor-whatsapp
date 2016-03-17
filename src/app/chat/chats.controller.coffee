'use strict'

ChatsCtrl = ($log, $scope, $ionicModal, $reactive, exportDebug) ->
  $log.info "Creating ChatsCtrl"
#	  With the new view caching in Ionic, Controllers are only called
#	  when they are recreated or on app start, instead of every page change.
#	  To listen for when this page is active (for example, to refresh data),
#	  listen for the $ionicView.enter event:
#
#	  $scope.$on '$ionicView.enter', (e) ->
  # $reactive(this).attach($scope)

  $scope.subscribe 'chats'

  $scope.helpers {
    'chats': ()->
      return Chats.find()
  }

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
    # Chats.remove(chat)
    this.call 'removeChat', chat._id # secure remove from server
    return

  exportDebug.set 'Chats', Chats # reference global MongoColletion
    
  return

ChatsCtrl.$inject = ['$log', '$scope', '$ionicModal', '$reactive', 'exportDebug']

angular.module 'starter.chat'
  .controller 'ChatsCtrl', ChatsCtrl
