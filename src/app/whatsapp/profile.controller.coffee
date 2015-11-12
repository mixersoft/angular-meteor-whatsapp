# profile.controller.coffee
'use strict'

ProfileCtrl = ($scope, $state, $meteor, $ionicLoading, $ionicPopup, $log)->

  user = Meteor.user()
  name = user && if user.profile then user.profile.name else ''

  $scope.data = {
    name: name
  }
  $scope.updateName = ()->
    return if _.isEmpty $scope.data.name

    $meteor.call 'updateName', $scope.data.name
    .then ()->
      $state.go 'tab.chats'
      return
    .catch handleError
    return


  handleError = (err)->
    $log.error('Profile Save error ', err)

    $ionicPopup.alert({
      title: err.reason || 'Profile Save failed',
      template: 'Please try again',
      okType: 'button-positive button-clear'
    })
    return




ProfileCtrl.$inject = ['$scope', '$state', '$meteor', '$ionicLoading', '$ionicPopup', '$log']

angular.module 'whatsapp.services'
  .controller 'ProfileCtrl', ProfileCtrl