$(function() {
	$('.tpanel .panel-title .tool .expand').click(function() {
		var panel = $(this).parent().parent().parent();
		var panelTitle = panel.children('.panel-title');
		var panelContent = panel.children('.panel-content');
		if(panelContent.is(':hidden')) {
			var height = panel.data('mHeight');
			panel.height(height + 'px');
			panelContent.slideDown();
		}else {
			panelContent.slideUp();
			if(!panel.data('mHeight')) {
			var height = panel.height();
			panel.data('mHeight',height);
				panel.height(panelTitle.height() + 4);	
			}
		}
	});
});