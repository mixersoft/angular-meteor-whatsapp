'use strict'

appRun = (routerHelper) ->
  routerHelper.configureStates getStates()

getStates = ->
  [
    state: 'login'
    config:
      url: '/login'
      templateUrl: 'whatsapp/login.html'
      controller: 'LoginCtrl'
  ,
    state: 'confirmation'
    config:
      url: '/confirmation/:phone'
      templateUrl: 'whatsapp/confirmation.html'
      controller: 'ConfirmationCtrl'
  ,
    state: 'profile'
    config:
      url: '/profile'
      templateUrl: 'whatsapp/profile.html'
      controller: 'ProfileCtrl'
      resolve:
        user: ['$auth', ($auth)-> return $auth.requireUser() ]
  ,
    state: 'tab.settings'
    config:
      url: '/settings'
      views:
        'tab-settings':
          templateUrl: 'whatsapp/settings.html'
          controller: 'SettingsCtrl'
  ]

appRun.$inject = ['routerHelper']

angular
  .module 'whatsapp.services'
  .run appRun