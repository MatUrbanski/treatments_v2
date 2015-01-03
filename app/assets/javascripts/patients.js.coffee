$ ->
  count_visitations = ->
    val = $('#visitation_times input:checkbox:checked').length
    $('.visitation_count').html(val)

  if $('#visitation_times').length > 0
    count_visitations()
    $('#visitation_times input:checkbox').click ->
      count_visitations()
