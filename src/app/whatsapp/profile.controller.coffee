# profile.controller.coffee
'use strict'

ProfileCtrl = ($scope, $state, $reactive, $ionicLoading, $ionicPopup, $log, toastr)->
  $reactive(this).attach($scope)
  user = Meteor.user()
  name = user.profile?.name || ''

  $scope.data = {
    name: name
  }
  $scope.updateName = ()->
    return if _.isEmpty $scope.data.name

    this.call 'updateName', $scope.data.name
    .then ()->
      $state.go 'tab.chats'
      return
    .catch handleError
    return

  $scope.updatePicture = ()->
    # get base64 DATA_URI from ngCordova Camera
    data = ""  # base64 DATA_URI
    $ionicLoading.show {
      template: 'Updating picture...'
    }
    this.call('updatePicture', data)
    .finally ()->
      $ionicLoading.hide()
    .catch (err)->
      handleError(err)
      return
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




ProfileCtrl.$inject = ['$scope', '$state', '$reactive', '$ionicLoading', '$ionicPopup'
'$log', 'toastr'
]

angular.module 'whatsapp.services'
  .controller 'ProfileCtrl', ProfileCtrl