Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function queryParams(params, searchForm) {
    if(!searchForm) {
        searchForm = '#searchForm';
    }
    var form = $(searchForm).serializeObject();
    for(var i in form) {
        params[i] = form[i];
    }
    params.page = params.offset / params.limit + 1;
    params.size = params.limit;
    params.offset = undefined;
    params.limit = undefined;
    return params;
}

function responseHandler(res) {
    return res.body;
}

function snFormatter(value, row, index) {
    return index + 1;
}

function search(searchForm,table) {
    $(table).bootstrapTable('refresh',{query:$(searchForm).serializeObject()});
    return false;
}

/**
 * 打开窗口
 * @param title 窗口标题
 * @param url   页面地址
 */
function openWindow(title,url) {
    window.parent.layer.open({
        type: 2,
        title: title,
        shadeClose: true,
        shade: [0.01, '#000'],
        area: [($(window.top).width() * 0.8) + 'px', ($(window.top).height() * 0.8) + 'px'],
        content: url
    });
}

/**
 * 慎重删除（需要当前登录用户密码）
 * @param url   删除地址
 * @param id    删除资源ID
 * @param tip   提示
 */
function carefulDelete(url,id,tip) {
    if(!tip) {
        tip = '请输入您的管理密码以确定删除此系统资源';
    }
    window.parent.bootbox.prompt({
        title: tip,
        onEscape : true,
        backdrop : true,
        animate : true,
        buttons: {
            confirm: {
                label: '删除',
                className: 'btn-danger'
            },
            cancel: {
                label: '取消',
                className: ''
            }
        },
        inputType: 'password',
        callback: function (result) {
            if(result) {
                $.post(url,{id:id,password:result},function(resp) {
                    if(resp.code == 'OK') {
                        window.parent.layer.msg('删除成功', {icon: 1});
                        $('#table').bootstrapTable('refresh');
                    }else {
                        window.parent.layer.msg('删除失败:' + resp.message, {icon: 2});
                    }
                },'json');
            }
        }
    });
}

/**
 * 初始化表单
 * @param form  表单ID
 * @param url   提交地址
 * @param handler   提交结果处理
 */
function initForm(form, url, handler) {
    $(form).validate({
        focusCleanup:true,
        focusInvalid:false,
        errorClass: "unchecked",
        validClass: "checked",
        errorElement: "span",
        submitHandler:function(form){
            $(form).ajaxSubmit({
                type:"post",
                url : url,
                beforeSubmit: function() {
                    window.parent.layer.load();
                },
                success: function(r) {
                    window.parent.layer.closeAll('loading');
                    handler(r);
                }
            });
            return false;
        },
        errorPlacement:function(error,element){
            var s = element.parent().find("span[htmlFor='" + element.attr("id") + "']");
            if(s!=null){
                s.remove();
            }
            error.appendTo(element.parent());
        },
        success: function(label) {
            label.removeClass("unchecked").addClass("checked");
        }
    });
}

/**
 * 修改标题
 * 若不是在contentFrame中调用，则不会修改标题
 * @param title 标题
 */
function changeTitle(title) {
    if(window == window.top['contentFrame']) {
        window.parent.changeTitle(title);
    }
}

function changeUrl(url) {
    window.parent.changeUrl(url);
}

function back() {
    window.history.back();
}

var topLayer = window.parent.layer;

var topBootbox = window.parent.bootbox;

$(function() {
    if(jQuery.isFunction(jQuery.fn.datetimepicker)) {
        $('.tf-datetimepicker').datetimepicker({
            language: 'zh-CN',
            autoclose: true,
            format:"yyyy-mm-dd hh:ii:ss"
        });
    }
});