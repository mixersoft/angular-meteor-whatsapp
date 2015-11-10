# filter.calendar.coffee
'use strict'

calendar = ()->
  return (time)->
    return if !time

    return moment(time).calendar(null, {
      lastDay : '[Yesterday]',
      sameDay : 'LT',
      lastWeek : 'dddd',
      sameElse : 'DD/MM/YY'
    })

angular.module 'blocks.components'
  .filter 'calendar', calendar