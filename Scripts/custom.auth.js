$(document).ready(function() {
	if($.browser.msie) $("body").addClass("ie");
	
	// outline fix
	$("a").each(function() {
		$(this).attr("hideFocus", "true").css("outline", "none");
	});
	
	if($.browser.msie && $.browser.version == 7) {
		$("input.inputtext").bind("focusin", function(){
			$(this).addClass("focus");
		}).bind("focusout", function(){
			$(this).removeClass("focus");
		});
		$("button.button.floatright").css({"marginTop":"-35px"});
	}
	$('ul.tabs').delegate('li:not(.active) a', 'click', function() {
		$(this).parents("ul").find(".active").removeClass('active');
		var li = $(this).parent();
		$(this).parent().addClass('active');
		$(this).parents(".content").children(".bcont").hide().eq(li.index()).show();
		return false;
	});
	$(".content").each(function(){
		if($(this).children(".bcont").size() > 1) $(this).children(".bcont:gt(0)").hide();
	});
	// closing message
	$('.message').live("click",function(){
		$(this).animate({opacity: 0}, 250, function(){
			$(this).slideUp(250, function(){$(this).remove()})});
			return false;
		}
	);
	$("#wrapper").css("paddingTop", "150px");
});