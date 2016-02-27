'use strict'

otherwisePath = '/app/home'
# otherwisePath = '/tab/chats'

appRun = (routerHelper) ->
  routerHelper.configureStates getStates(), otherwisePath

getStates = ->
  [
    state: 'tab'
    config:
      url: '/tab'
      abstract: true
      templateUrl: 'layout/tabs.html'
      resolve:
        user: ['$meteor', ($meteor)-> return $meteor.requireUser() ]
        chats: ['$meteor', ($meteor)-> return $meteor.subscribe('chats')]
  ,
    state: 'app'
    config:
      url: '/app'
      abstract: true
      templateUrl: 'layout/sidemenu.html'
      # controller: 'AppCtrl'
      # controllerAs: 'vm'
  ]

appRun.$inject = ['routerHelper']

angular
  .module 'starter.layout'
  .run appRun
