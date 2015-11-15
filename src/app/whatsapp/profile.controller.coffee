# profile.controller.coffee
'use strict'

ProfileCtrl = ($scope, $state, $meteor, $ionicLoading, $ionicPopup, $log, toastr)->

  user = Meteor.user()
  name = user.profile?.name || ''

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

  return




ProfileCtrl.$inject = ['$scope', '$state', '$meteor', '$ionicLoading', '$ionicPopup'
'$log', 'toastr'
]

angular.module 'whatsapp.services'
  .controller 'ProfileCtrl', ProfileCtrl