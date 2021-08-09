$(document).on('turbolinks:load', function () {
  $('#product_table').DataTable({
    "bAutoWidth": false,
    "processing": true,
    "info": true,
    "stateSave": true,
    "serverSide": false,
    "ajax": {
      "url": "/homepage/get_list_products",
      "type": "GET",
      "dataSrc":"",
      "complete": function(xhr, responseText){
        console.log(xhr);
        console.log(responseText);
      }
    },
    "columns": [
      { "data": "store" },
      { "data": "name" },
      { "data": "price" },
      { "data": "quantity" },
      { "data": "variant" },
      { "data": "description" },
      {
        "data": function (data) {
          return '<a class="btn btn-info" href="/products/'+ data["product_id"] +'">View</a> &nbsp;'+
          '<a class="btn btn-info" href="/products/'+ data["product_id"] +'/edit">Update</a> &nbsp;'+
          '<a class="btn btn-danger" href="/products/'+ data["product_id"] +'" data-method="delete">Delete</a>'
        }
      }
    ]
  });
});