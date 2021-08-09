$(document).on('turbolinks:load', function () {
  $('#store_table').DataTable({
    "bAutoWidth": false,
    "processing": true,
    "info": true,
    "stateSave": true,
    "serverSide": false,
    "ajax": {
      "url": "/stores/get_list_stores",
      "type": "GET",
      "dataSrc":"",
      "complete": function(xhr, responseText){
        console.log(xhr);
        console.log(responseText);
      }
    },
    "columns": [
      { "data": "name" },
      { "data": "phone" },
      { "data": "address" },
      {
        "data": function (data) {
          return '<a class="btn btn-info" href="/stores/'+ data["store_id"] +'/edit">Update</a> &nbsp;'+
          '<a class="btn btn-danger" href="/stores/'+ data["store_id"] +'" data-method="delete">Delete</a>'
        }
      }
    ]
  });
});