# login.controller.coffee
'use strict'

SettingsCtrl = ($scope, $meteor, $state)->

  $scope.logout = ()->
    $meteor.logout().then ()->
      $state.go('login')


SettingsCtrl.$inject = ['$scope', '$meteor', '$state']

angular.module 'whatsapp.services'
  .controller 'SettingsCtrl', SettingsCtrl