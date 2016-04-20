import "phoenix_html"

var fl = $("fieldset legend")

fl.click(function() {
  if ($(this).parent().children().length == 2)
    $(this).parent().find("div").toggle();
  else
  {
    $(this).parent().wrapInner("<div>");
    $(this).appendTo($(this).parent().parent());
    $(this).parent().find("div").toggle();
  }
});
