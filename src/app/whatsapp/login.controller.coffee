# login.controller.coffee
'use strict'

LoginCtrl = ($scope, $state, $ionicLoading, $ionicPopup, $log)->
  $scope.data = {}
  $scope.login = ()->
    return if _.isEmpty $scope.data.phone

    confirmPopup = $ionicPopup.confirm {
      title: 'Number confirmation',
      template: '<div>' + $scope.data.phone + '</div><div>Is your phone number above correct?</div>'
      cssClass: 'text-center',
      okText: 'Yes',
      okType: 'button-positive button-clear',
      cancelText: 'edit',
      cancelType: 'button-dark button-clear'
    }

    confirmPopup.then (res)->
      return if !res

      $ionicLoading.show({
        template: 'Sending verification code...'
      })
 
      Accounts.requestPhoneVerification $scope.data.phone, (err)->
        $ionicLoading.hide()

        return handleError(err) if err

        $state.go('confirmation', { phone: $scope.data.phone })
        return
    return

  handleError = (err)->
    $log.error('Login error ', err)

    $ionicPopup.alert({
      title: err.reason || 'Login failed',
      template: 'Please try again',
      okType: 'button-positive button-clear'
    })
    return




LoginCtrl.$inject = ['$scope', '$state', '$ionicLoading', '$ionicPopup', '$log']

angular.module 'whatsapp.services'
  .controller 'LoginCtrl', LoginCtrl