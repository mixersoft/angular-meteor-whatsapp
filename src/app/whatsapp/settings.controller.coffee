# login.controller.coffee
'use strict'

SettingsCtrl = ($scope, $state)->

  $scope.logout = ()->
    Meteor.logout().then ()->
      $state.go('login')


SettingsCtrl.$inject = ['$scope', '$state']

angular.module 'whatsapp.services'
  .controller 'SettingsCtrl', SettingsCtrl