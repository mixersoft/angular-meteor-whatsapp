# input.directive.coffee
'use strict'

# // The directive enable sending message when tapping return
# // and expose the focus and blur events to adjust the view
# // when the keyboard opens and closes
InputDirective = ($timeout)->
  directive = {
    restrict: 'EA',
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


angular.module('blocks.components')
  .directive 'autoInput', InputDirective