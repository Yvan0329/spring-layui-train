$.fn.navtabs = function(options) {
	var that = $(this);
	var defaults = {
		data: undefined,
		url : undefined
	};
	var opts = $.extend(defaults, options);
	
	/*<div class="nav-tabs-title">
		<div class="prev"><i class="iconfont icon-backward"></i></div>
		<div class="tabs-list">
			<ul>
				<li class="active">首页</li>
			</ul>
		</div>
		<div class="next"><i class="iconfont icon-forward"></i></div>
		<div class="operate">
			<a href="javascript:void(0);">
				<span>关闭操作</span>
				<i class="iconfont icon-caret"></i>
			</a>
			<ul class="dropdown">
				<li><a class="locate-current" href="javascript:void(0);">定位当前选项卡</a></li>
				<li><a class="close-all" href="javascript:void(0);">关闭全部选项卡</a></li>
				<li><a class="close-other" href="javascript:void(0);">关闭其他选项卡</a></li>
			</ul>
		</div>
		<a class="exit">
			<i class="iconfont icon-signout"></i>
			退出
		</a>
	</div>
	
	<div class="nav-tabs-content">
		<div class="active">
			<iframe src=""></iframe>
		</div>
	</div>*/
	var html = '<div class="nav-tabs-title">';
	html += '<div class="prev"><i class="iconfont icon-backward"></i></div>';
	html += '<div class="tabs-list">';
	html += '<ul>';
	html += '<li class="active">首页</li>';
	html += '</ul>';
	html += '</div>';
	html += '<div class="next"><i class="iconfont icon-forward"></i></div>';
	html += '<div class="operate">';
	html += '<a href="javascript:void(0);">';
	html += '<span>关闭操作</span>';
	html += '<i class="iconfont icon-caret"></i>';
	html += '</a>';
	html += '<ul class="dropdown">';
	html += '<li><a class="locate-current" href="javascript:void(0);">定位当前选项卡</a></li>';
	html += '<li><a class="close-all" href="javascript:void(0);">关闭全部选项卡</a></li>';
	html += '<li><a class="close-other" href="javascript:void(0);">关闭其他选项卡</a></li>';
	html += '</ul>';
	html += '</div>';
	html += '<a class="exit">';
	html += '<i class="iconfont icon-signout"></i>';
	html += '退出';
	html += '</a>';
	html += '</div>';		
	html += '<div class="nav-tabs-content">';
	html += '<div class="active">';
	html += '<iframe src="' + opts.index + '"></iframe>';
	html += '</div>';
	html += '</div>';
	that.html(html);
	
	var tabsList = that.find('.nav-tabs-title .tabs-list');
	var tabsUl = that.find('.nav-tabs-title .tabs-list ul');
	var tabsContentWrapper = that.find('.nav-tabs-content');
	var operate = that.find('.nav-tabs-title .operate');
	var dropdown = operate.children('.dropdown');
	var indexTabs = that.find('.nav-tabs-title .tabs-list ul li:first-child');
	
	var lastActiveTab = indexTabs;
	
	//	折叠/展开关闭操作
	operate.children('a').click(function() {
		var dropdown = $(this).next('.dropdown');
		dropdown.fadeIn();
	});
	dropdown.mouseout(function(event) {
		var s = event.toElement || event.relatedTarget; 
		if (!this.contains(s)) {
			$(this).fadeOut(); 
		}
	});
	
	//	切换Tab
	that.switchTab = function(curLi) {
		var tabsContent = tabsContentWrapper.children('div');
		if(lastActiveTab) {
			lastActiveTab.removeClass('active');
			tabsContent.eq(lastActiveTab.index()).removeClass('active');
		}
		lastActiveTab = curLi;
		curLi.addClass('active');
		tabsContent.eq(curLi.index()).addClass('active');
	}
	//	关闭Tab
	that.closeTab = function(curLi) {
		var tabsContent = tabsContentWrapper.children('div');
		var index = curLi.index();
		if(curLi.hasClass('active')) {
			var prev = curLi.prev();
			that.switchTab(prev);
		}
		tabsContent.eq(curLi.index()).remove();
		curLi.remove();
	}
	//	添加Tab
	that.addTab = function(title,url) {
		var li = $('<li class="closeable"><span>' + title + '</span><i class="close iconfont icon-closecircle"></i></li>');
		tabsUl.append(li);
		var iframe = $('<div><iframe src=""></iframe></div>');
		tabsContentWrapper.append(iframe);
		that.switchTab(li);
		setTimeout(function () {
			iframe.children('iframe').attr('src',url);
		}, 500);
	}

	//	标签关闭
	tabsUl.delegate('li i.close','click',function(event) {
		var curLi = $(this).parent();
		that.closeTab(curLi);
		event.stopPropagation();
	});
	//	标签点击
	tabsUl.delegate('li','click',function() {
		var curLi = $(this);
		that.switchTab(curLi);
	});

	//	翻页
	that.find('.nav-tabs-title .prev').click(function() {
		tabsUl.stop();
		var left = parseInt(tabsUl.css('margin-left'));
		var targetLeft = left - 150;
		var tabsListWidth = tabsList.width();
		var ulWidth = tabsUl.width();
		if(ulWidth > tabsListWidth) {
			var bestLeft = tabsListWidth - ulWidth - 150;
			if(targetLeft < bestLeft) {
				targetLeft = bestLeft;
			}
		}
		tabsUl.animate({'margin-left' : targetLeft + 'px'}, 300);
	});
	that.find('.nav-tabs-title .next').click(function() {
		tabsUl.stop();
		var left = parseInt(tabsUl.css('margin-left'));
		var targetLeft = left + 150;
		if(left < 0) {
			if(left + 150 > 0) {
				targetLeft = 0;
			}
			tabsUl.animate({'margin-left' : targetLeft + 'px'}, 300);	
		}
	});

	//	定位当前标签
	dropdown.find('.locate-current').click(function() {
		
	});
	//	关闭全部标签
	dropdown.find('.close-all').click(function() {
		that.switchTab(indexTabs);
		var tabs = tabsUl.find('li.closeable');
		tabs.remove();
	});
	//	关闭其他标签
	dropdown.find('.close-other').click(function() {
		var tabs = tabsUl.find('li.closeable');
		$.each(tabs, function(i,item) {
			var curItem = $(item);
			if(!curItem.hasClass('active')) {
				curItem.remove();
			}
		});
	});
	
	return that;
};
