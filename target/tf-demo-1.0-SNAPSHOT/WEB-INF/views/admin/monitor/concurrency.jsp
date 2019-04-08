<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>节点并发监控</title>

	<%@include file="/WEB-INF/layouts/index-header.jsp"%>

	<script type="text/javascript" src="${staticPath}/admin/lib/echarts/echarts.js"></script>
</head>
<body>

<div class="tpanel">
	<div class="panel-content">
		<div class="container-fluid">
			<div id="concurrency" style="height:600px;padding:30px;width:100%;"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
    changeTitle('节点并发监控');

    var myChart = echarts.init(document.getElementById('concurrency'));

    function randomData() {	//返回的是json格式的数据，name对应横坐标，是时间，value又是一个数组
        now = new Date(+now + 1000);
        console.log(now);
        var value = 0;
        var minute = now.getMinutes() < 10 ? '0'+now.getMinutes() : now.getMinutes();
        var second = now.getSeconds() < 10 ? '0'+now.getSeconds() : now.getSeconds();
        return {
            name: now.Format('hh:mm:ss'),
            value: [
                [now.getFullYear(), now.getMonth(), now.getDate()].join('/')+" "+[now.getHours(),minute,second].join(':'),
                value
            ]
        }
    }

    var now = +new Date(+new Date() - 1001 * 1000);
    var data = [];
    for (var i = 0; i < 1000; i++) {
        data.push(randomData());//先在其中放1000个数据
    }

    option = {
        title: {
            text: '当前节点并发量走势'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                return params.name + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: true
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: true
            }
        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: true//代表横向分隔线
            }
        },
        series: [{
            name: '模拟数据',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: data
        }]
    };

    myChart.setOption(option);

    setInterval(function () {

        $.get('${ctx}/admin/druid/webapp.json', function(r) {
            data.shift();

            var now = new Date();
            var minute = now.getMinutes() < 10 ? '0'+now.getMinutes() : now.getMinutes();
            var second = now.getSeconds() < 10 ? '0'+now.getSeconds() : now.getSeconds();

            var item = {
                name: now.Format('hh:mm:ss'),
                value: [
                    [
                        now.getFullYear(), now.getMonth(), now.getDate()].join('/')+" "+[now.getHours(),minute,second].join(':'),
                    	r.Content[0].RunningCount
					]
            };
            data.push(item);
            myChart.setOption({
                series: [{
                    data: data
                }]
            });
		}, 'json');
    }, 1000);
</script>

</body>
</html>
