# login.controller.coffee
'use strict'

ConfirmationCtrl = ($scope, $state, $ionicPopup, $log)->

  $scope.phone = $state.params.phone
  $scope.data = {}
  $scope.verify = ()->
    return if _.isEmpty $scope.data.code

    Accounts.verifyPhone $scope.phone, $scope.data.code, (err)->
      return handleError(err) if (err)
 
      $state.go('profile')
      return

  handleError = (err)->
    $log.error('Verification error ', err)

    $ionicPopup.alert({
      title: err.reason || 'Verification failed',
      template: 'Please try again',
      okType: 'button-positive button-clear'
    })
    return




ConfirmationCtrl.$inject = ['$scope', '$state', '$ionicPopup', '$log']

angular.module 'whatsapp.services'
  .controller 'ConfirmationCtrl', ConfirmationCtrl