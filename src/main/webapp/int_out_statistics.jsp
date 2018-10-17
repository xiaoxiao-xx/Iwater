<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台登录-X-admin1.1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>

</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="./home.jsp">IWATER V1.0</a></div>
    <div class="open-nav"><i class="iconfont">&#xe699;</i></div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item"><a href="#">收支统计</a></li>
        <li class="layui-nav-item"><a href="../userController/logout.do">退出登录</a></li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<div class="wrapper">
    <!-- 左侧菜单开始 -->
    <div class="left-nav">
        <div id="side-nav">
            <ul id="nav">
                <li class="list" current>
                    <a href="./home.jsp">
                        <i class="iconfont">&#xe761;</i>
                        首页
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                </li>
                <ul class="list">
                    <li>
                        <a href="customer_list.jsp">
                            会员列表
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                    <li>
                        <a href="goods_list.jsp">
                            商品列表
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                    <li>
                        <a href="water_ticket.jsp">
                            水票充值
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                    <li>
                        <a href="bucket_manage.jsp">
                            押桶管理
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                    <li>
                        <a href="water_sale.jsp">
                            出货管理
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                    <li>
                        <a href="buy_in.jsp">
                            进货管理
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                    <li>
                        <a href="./waterSale_statistics.jsp">
                            售货统计
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                    <li>
                        <a href="./buy_in_statistics.jsp">
                            进货统计
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                    <li>
                        <a href="./int_out_statistics.jsp">
                            收支统计
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                </ul>
            </ul>
        </div>
    </div>
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span >年度统计</span>
                </label>
            <div class="layui-input-inline">
                <input id="time" type="text" class="layui-input" value=" ">
            </div>
                <button class="layui-btn" onclick="show_month()">查询</button>
            </div>
            <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
            <div id="main" style="width: 100%;height:600px;"></div>
            <!-- 右侧内容框架，更改从这里结束 -->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->

<script src="./js/echarts.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/echarts-for-x-admin.js"></script>

<script type="text/javascript">
    $(function () {
        show();
    });
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    option = {
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data:['利润', '支出', '收入']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'value'
            }
        ],
        yAxis : [
            {
                type : 'category',
                axisTick : {show: false},
                data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'].reverse()
            }
        ],
        series : [{
            name:'利润',
            type:'bar',
            label: {
                normal: {
                    show: true,
                    position: 'inside'
                }
            },
            data:[]
        },
            {
                name:'收入',
                type:'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true
                    }
                },
                data:[]
            },
            {
                name:'支出',
                type:'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'left'
                    }
                },
                data:[]
            }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    // 使用刚指定的配置项和数据显示图表。
    var date = new Date();
    var year = date.getFullYear();

    var index;

    function fill(arr) {
        for (var i = 0; i <12 ; i++) {
            if(isNaN(arr[i])){
                arr[i]=0;
            }
        }
    }

    function changeSymbol(arr) {
        for (var i = 0; i <12 ; i++) {
            arr[i] = -arr[i];
        }
    }
    function show(time) {
        if(time === undefined)
            time = year;
        $.getJSON('moneyController/showStatistics.ajax',{time:time},function (data) {
            if(data.length!=0) {
                var income = new Array();
                var outcome = new Array();
                var profit = new Array();
                for (var i = 0; i < data.length; i++) {
                    index = data[i].month - 1;
                    income[index] = data[i].income;
                    outcome[index] = data[i].outcome;
                    profit[index] = data[i].profit;
                }
                fill(income);
                fill(outcome);
                changeSymbol(outcome);
                fill(profit);
                myChart.setOption({
                    series: [{
                        name: '利润',
                        type: 'bar',
                        label: {
                            normal: {
                                show: true
                                // position: 'inside'
                            }
                        },
                        data: profit
                    },
                        {
                            name: '收入',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    show: true
                                }
                            },
                            data: income
                        },
                        {
                            name: '支出',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    show: true,
                                    position: 'left'
                                }
                            },
                            data: outcome
                        }]
                });
            }else{
                var income = new Array();
                var outcome = new Array();
                var profit = new Array();
                myChart.setOption({
                    series: [{
                        name: '利润',
                        type: 'bar',
                        label: {
                            normal: {
                                show: true
                                // position: 'inside'
                            }
                        },
                        data: profit
                    },
                        {
                            name: '收入',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    show: true
                                }
                            },
                            data: income
                        },
                        {
                            name: '支出',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    show: true,
                                    position: 'left'
                                }
                            },
                            data: outcome
                        }]
                });
            }
        })
    }

    function show_month() {
        var time = document.getElementById("time").value;
        if(time == null || time == " " || time == ''){
            time = year;
        }
        console.log(time);
        show(time);
    }

</script>
<script>
    layui.use('laydate',function () {
        var laydate = layui.laydate;
        laydate.render({
            elem:'#time',
            type:'year'
        })
    })

</script>
</body>
</html>