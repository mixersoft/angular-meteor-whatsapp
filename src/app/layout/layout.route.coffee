'use strict'

# otherwisePath = '/app/home'
otherwisePath = '/tab/chats/'

appRun = (routerHelper, $location) ->
  routerHelper.configureStates getStates(), otherwisePath
  # HACK: otherwise routing not working after angualar-meteor#1.3.3
  if not $location.path()
    location.href = '#' + otherwisePath
  else
    location.href = '#/tab'

getStates = ->
  [
    state: 'tab'
    config:
      url: '/tab'
      abstract: true
      templateUrl: 'layout/tabs.html'
      resolve:
        user: ['$auth', ($auth)-> return $auth.requireUser() ]
        # chats: ['$meteor', ($meteor)-> return $meteor.subscribe('chats')]
  ,
    state: 'app'
    config:
      url: '/app'
      abstract: true
      templateUrl: 'layout/sidemenu.html'
      # controller: 'AppCtrl'
      # controllerAs: 'vm'
  ]

appRun.$inject = ['routerHelper', '$location']

angular
  .module 'starter.layout'
  .run appRun
