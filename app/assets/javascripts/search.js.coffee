$ ->
  $('#search_form_query').val('')
  $('#search_form_query').bind "keyup", (e) ->
    $('#search form').submit()