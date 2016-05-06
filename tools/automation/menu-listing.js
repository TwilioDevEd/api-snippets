$.each($("li#quickstart a"), function( index, value ) {
  var link = $(value);
  console.log( link.html() + ": " + link.attr("href") );
})