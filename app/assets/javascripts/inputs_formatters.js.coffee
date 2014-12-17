$ ->
  $("#patient_pesel").formatter
    pattern: "{{99999999999}}"

  $('.zip_code').formatter
    pattern: '{{99}}-{{999}}'

  $('#patient_birth_date').formatter
    'pattern': '{{9999}}-{{99}}-{{99}}'
