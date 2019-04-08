function generateNestableTree(url,target,modifyFun,deleteFun) {
    $.getJSON(url,function(result) {
        if(result.code == 'OK') {
            fillData(result.body);
        }
    });

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
        var html = '<ol class="dd-list">';
        for(var index in tree) {
            html += generate(tree[index],true);
        }
        html += '</ol>';
        $(target).html(html);
        $(target).nestable('collapseAll');
    }
    function generate(item,hasIcon) {
        var html = '';
        if(item) {
            var hasChildren = item.children && item.children.length;
            html += '<li class="dd-item" data-id="' + item.id + '">';
            if(hasChildren) {
                html += '<button data-action="collapse" type="button">Collapse</button>';
                html += '<button data-action="expand" type="button" style="display: none;">Expand</button>';
            }
            html += '<div class="dd-handle">';
            html += '<span>' + item.name + '</span>';
            html += '<div class="op">';
            html += '<div class="modify" title="编辑" onmousedown="' + modifyFun + '(' + item.id + ',event)">'
                + '<i class="iconfont icon-iconfontcolor32"></i></div>';
            html += '<div class="delete" title="删除" onmousedown="' + deleteFun + '(' + item.id + ',event)">'
                + '<i class="iconfont icon-shanchu"></i></div>';
            html += '</div>';
            html += '</div>';
           /*if(hasIcon) {
                html += '<i class="iconfont ' + item.iconCls + '"></i>';
            }*/
            /*html += '<span>' + item.name + '</span>';*/
            /*if(hasChildren) html += '<i class="arrow iconfont icon-lunbozuofangun"></i>';
            html += '</a>';*/
            if(hasChildren) {
                html += '<ol class="dd-list">';
                for(var index in item.children) {
                    var child = item.children[index];
                    html += generate(child,false);
                }
                html += '</ol>';
            }
            html += '</li>';
        }
        return html;
    }
}

function stopBubble(e)
{
    if (e && e.stopPropagation)
        e.stopPropagation()
    else
        window.event.cancelBubble=true
}