$ ->
  dataTable = (table_id, array=[], sorting = [[0, "asc"]]) ->
    $("#{table_id}").dataTable
      "iDisplayLength": 10
      "aaSorting": sorting
      "aoColumnDefs" : [ {
        'bSortable' : false,
        'aTargets' : array
      } ]
      "oLanguage": {
        "sUrl": "//cdn.datatables.net/plug-ins/725b2a2115b/i18n/Polish.json"
    }
  dataTable(["#ordering_units"], [-1], [[0, "desc"]])
