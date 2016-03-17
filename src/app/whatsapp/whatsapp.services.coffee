# whatsapp.services.coffee
'use strict'


authRun = ($rootScope, $state)->
  $rootScope.$on '$stateChangeError',  (event, toState, toParams, fromState, fromParams, error)->
    # // We can catch the error thrown when the $requireUser promise is rejected
    # // and redirect the user back to the main page
    if (error == 'AUTH_REQUIRED')
      $state.go('login')
    return

authRun.$inject = ['$rootScope', '$state']

angular.module 'whatsapp.services'
  .run authRun
