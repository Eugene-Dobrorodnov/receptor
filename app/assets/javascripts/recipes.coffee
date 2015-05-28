# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  $(document).on 'click', 'a.remove_step', (event) ->
    $(@).closest("li").slideUp('normal', -> $(@).remove())

  $('a.add-nested-field').click ->
    association = $(@).data('association')
    new_id = $('ul.nested-fields li').length
    regexp = new RegExp('new_' + association, 'g')
    content = JSON.parse($(@).data('content').replace(regexp, new_id))
    $('ul.nested-fields').append content
    return false
