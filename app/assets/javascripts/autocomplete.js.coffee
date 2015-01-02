$ ->
  $('#treatment_patient_find').autocomplete
    source:  $('#treatment_patient_find').data('autocomplete-source')
    select: (event, ui) ->
      $('#treatment_patient_find').val ui.item.label
      $('#treatment_patient_id').val ui.item.id
      block_patient_find_input()
      false


  block_patient_find_input = ->
    if $('#treatment_patient_id').length == 1 and $('#treatment_patient_id').val().length > 0
      $('#treatment_patient_find').attr('readonly', true)
    else
      $('#treatment_patient_find').attr('readonly', false)

  block_patient_find_input()

  $("a.change_patient").click ->
    $('#treatment_patient_find').attr('readonly', false)
    $('#treatment_patient_find').val('')
    $('#treatment_patient_id').val('')

