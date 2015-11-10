'use strict'

ChatsCtrl = ($log, $scope, exportDebug) ->
  $log.info "Creating ChatsCtrl"
#	  With the new view caching in Ionic, Controllers are only called
#	  when they are recreated or on app start, instead of every page change.
#	  To listen for when this page is active (for example, to refresh data),
#	  listen for the $ionicView.enter event:
#
#	  $scope.$on '$ionicView.enter', (e) ->

  $scope.chats = $scope.$meteorCollection(Chats)
  $scope.remove = (chat) ->
    $scope.chats.remove(chat)
    return


  exportDebug.set 'Chats', Chats # reference global MongoColletion
    
  return

ChatsCtrl.$inject = ['$log', '$scope', 'exportDebug']

angular.module 'starter.chat'
  .controller 'ChatsCtrl', ChatsCtrl
