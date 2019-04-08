$.fn.accordion = function(options) {
	var that = $(this);
	var defaults = {
		data: undefined,
		url : undefined,
		onClick : undefined
	};
	var opts = $.extend(defaults, options);
	
	/*<li><a href="javascript:void(0);"><i class="iconfont icon-caidanguanli"></i><span>菜单管理</span></a></li>
	<li>
		<a href="javascript:void(0);"><i class="iconfont icon-caidanguanli"></i><span>菜单管理</span><i class="arrow iconfont icon-lunbozuofangun"></i></a>
		<ul>
			<li>
				<a href="javascript:void(0);"><span>菜单管理</span><i class="arrow iconfont icon-lunbozuofangun"></i></a>
				<ul>
					<li><a href="javascript:void(0);"><span>菜单管理</span></a></li>
					<li><a href="javascript:void(0);"><span>菜单管理</span></a></li>
					<li><a href="javascript:void(0);"><span>菜单管理</span></a></li>
				</ul>
			</li>
			<li><a href="javascript:void(0);"><span>菜单管理</span></a></li>
			<li><a href="javascript:void(0);"><span>菜单管理</span></a></li>
		</ul>
	</li>*/
	function generate(item,hasIcon) {
		var html = '';
		if(item) {
			var hasChildren = item.children && item.children.length;
			html += '<li>';
			html += '<a href="javascript:void(0);" url="' + _ctx + item.url + '">';
			if(hasIcon) {
				html += '<i class="iconfont ' + item.iconCls + '"></i>';	
			}
			html += '<span>' + item.name + '</span>';
			if(hasChildren) html += '<i class="arrow iconfont icon-lunbozuofangun"></i>';
			html += '</a>';
			if(hasChildren) {
				html += '<ul>';
				for(var index in item.children) {
					var child = item.children[index];
					html += generate(child,false);
				}
				html += '</ul>';
			}
			html += '</li>';
		}
		return html;
	}
	
	function fillData(data) {
		var param = {
		    list:data,
		   	inParams:{
		        pid:"parentId",  
		        rootId : null,  
		        id:'id'
		    },  
		    outParams:{  
		        children:"children",
		        pid:"pid",
		        id:'id' 
		    }, 
		     sort:{
		        orderBy:["sort"],  
		        sort:"asc"
			}
		};
		var tree = wg_listToTree(param); 
		var html = '';
		for(var index in tree) {
			html += generate(tree[index],true);
		}
		that.html(html);
	}

	if(opts.data) {
		fillData(opts.data);
	}else if(opts.url) {
		$.getJSON(opts.url,function(result) {
			fillData(result);
		});
	}
    $('.menu-wrapper').perfectScrollbar();
	$('.expand-menu a.toggle').click(function() {
        $('.menu-wrapper').slideToggle();
	});

	var lastFocusItem = undefined;
	that.delegate( 'li', 'click', function(event) {
		var curLi = $(this);
		//	去除上次选中菜单项的焦点状态，聚焦为本次选中菜单项
		if(lastFocusItem) {
			lastFocusItem.removeClass('focus-item');
		}
		curLi.addClass('focus-item');
		lastFocusItem = curLi;
		
		//	折叠所有兄弟节点
		var siblings = curLi.siblings();
		$.each(siblings,function(i,item) {
			var brother = $(item);
			if(brother.hasClass('sub-menu-expand')) {
				brother.removeClass('sub-menu-expand');
			}
			var arrow = brother.children('a').children('.arrow');
			arrow.removeClass('icon-downarrow');
			arrow.addClass('icon-lunbozuofangun');
			var ul = brother.children('ul');
			if(ul && ul.is(":visible")) {
				ul.slideUp();
			}
		});
		
		//	展开/折叠本菜单项的子菜单
		var childUl = curLi.children('ul');
		if(childUl.length) {
			if(childUl.is(":visible")) {
				curLi.removeClass('sub-menu-expand');
				childUl.slideUp();
				var arrow = curLi.children('a').children('.arrow');
				if(arrow.length) {
					arrow.removeClass('icon-downarrow');
					arrow.addClass('icon-lunbozuofangun');
				}
			}else {
				curLi.addClass('sub-menu-expand');
				childUl.slideDown();
				var arrow = curLi.children('a').children('.arrow');
				if(arrow.length) {
					arrow.addClass('icon-downarrow');
					arrow.removeClass('icon-lunbozuofangun');
				}
			}
		}else {
			var url = curLi.children('a').attr('url');
			var title = curLi.find('a span').text();
			if(opts.onClick && url && url != 'null') {
				opts.onClick(title, url);
			}
		}
        setTimeout("$('.menu-wrapper').perfectScrollbar('update')",500);
		event.stopPropagation();
	});
};