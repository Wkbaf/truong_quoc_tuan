$(document).ready(function () {
    $('#product_table').DataTable({
      "processing": true,
      "info": true,
      "stateSave": true,
      "serverSide": true,
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
        { "data": "description" },
        {
          "data": "Inquiry", "bSearchable": false, "bSortable": false, "sWidth": "40px",
          "data": function (data) {
            console.log("data", data)
              return '<button class="btn btn-danger" type="button">' + data.name + 'Delete</button>'
          }
        }
      ]
    });
});