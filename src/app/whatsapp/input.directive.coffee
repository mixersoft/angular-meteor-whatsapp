# input.directive.coffee
'use strict'

InputDirective = ($timeout)->
  directive = {
    restrict: 'E',
    scope: {
      'returnClose': '=',
      'onReturn': '&',
      'onFocus': '&',
      'onBlur': '&'
    },
    link: (scope, element, attrs) ->
      element.bind 'focus', (e)->
        if scope.onFocus
          $timeout ()-> scope.onFocus()
        return

      element.bind 'blur', (e)->
        if scope.onBlur
          $timeout ()-> scope.onBlur()
        return

      element.bind 'keydown', (e)->
        if e.which == 13
          if scope.returnClose
            element[0].blur()
          if scope.onReturn
            $timeout ()-> scope.onReturn()
        return



  }
  return directive


InputDirective.$inject = ['$timeout']


angular.module('starter')
  .directive 'input', InputDirective