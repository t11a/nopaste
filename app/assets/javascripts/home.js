
$(document).ready(function() {
  $('#content-form')
    .on("ajax:success", function(e, data, status, xhr) {
      //console.log(e);
      console.log("id: " + data.id);
      console.log("key: " + data.key);
      console.log("name: " + data.name);

      location.href = "/p/" + data.key;
    })
    .on("ajax:error", function(e, xhr, status, error) {
      console.log("error");
    });
});
