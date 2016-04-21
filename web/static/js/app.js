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
window.addEventListener('load', function() {
	$('.remove-grp').click(function() {
		$(this).parent().remove();
	});
	$("#phone-add").click(function() {
		var grp = $('<div/>').attr('class', 'input-group');
		var input = $("<input/>")
			.attr('type', 'phone')
			.attr('name', 'client[contact][phones][]')
			.attr('class', 'form-control')
		var rem_btn = $('<a/>').attr('role', 'button').attr('class', 'input-group-addon').text('-');
		rem_btn.on('click', function(){
			grp.remove();
		});
		grp.append(input).append(rem_btn);
		grp.insertBefore($(this));
	});
	$("#email-add").click(function() {
		var grp = $('<div/>').attr('class', 'input-group');
		var input = $("<input/>")
			.attr('type', 'email')
			.attr('name', 'client[contact][emails][]')
			.attr('class', 'form-control')
		var rem_btn = $('<a/>').attr('role', 'button').attr('class', 'input-group-addon').text('-');
		rem_btn.on('click', function(){
			grp.remove();
		});
		grp.append(input).append(rem_btn);
		grp.insertBefore($(this));
	});
});
