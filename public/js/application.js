$(document).ready(function(){
  ajaxRequest(window.location + '/table1', $("#table-1"))

  $("#search-box").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#table1 tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });

  $(document).on('click', '#table1 tr', function () {
    name = $(this).closest('tr').find('td:eq(0)').text() // this will be the text of each <td>
    ajaxRequest(window.location + `/${name}`, $("#greet"))
   });
});

function ajaxRequest(url, selectedElement){
  $.ajax({
    url: url,
    cache: false,
    success: function(html) {
      selectedElement.html(html)
    },
    error: function() {
      selectedElement.html("Error")
    }
  })
}
