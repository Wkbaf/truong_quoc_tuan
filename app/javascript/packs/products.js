$(document).ready(function () {
    $('#product_table').DataTable({
      "bAutoWidth": false,
      "processing": true,
      "info": true,
      "stateSave": true,
      "serverSide": false,
      "ajax": {
        "url": "/users/get_list_products",
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
        { "data": "description" }
      ]
    });
});