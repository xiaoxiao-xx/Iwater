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
        <li class="layui-nav-item"><a href="#">进货统计</a></li>
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
                    <span class="x-right"></span>月度统计
                </label>
            <div class="layui-input-inline">
                <input id="time" type="text" class="layui-input" value=" ">
            </div>
                <button class="layui-btn" onclick="show_month()">查询</button>
            </div>
            <!-- 右侧内容框架，更改从这里开始 -->
            <blockquote class="layui-elem-quote">
                各种品牌桶装水进货统计
            </blockquote>
            <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
            <div id="main" style="width: 100%;height:400px;"></div>
            <!-- 右侧内容框架，更改从这里结束 -->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->

<script src="./js/echarts.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/echarts-for-x-admin.js"></script>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    option = {
        title : {
            text: '进货统计饼状图',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: []
        },
        series : [
            {
                name: '商品数据',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    /*{value:335, name:'直接访问'},
                    {value:310, name:'邮件营销'},
                    {value:234, name:'联盟广告'},
                    {value:135, name:'视频广告'},
                    {value:1548, name:'搜索引擎'}*/
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    $(function () {
    show();
});

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    function show(time) {
        $.getJSON('buyInController/showStatistics.ajax',{time:time},function (data) {
            console.log(data.length)
            if(data.length!=0){
                myChart.setOption({
                    series:[{
                        data:data
                    }],
                    legend:{
                        data:data.name
                    }
                });
            }else{
                myChart.setOption({
                    series:[{
                        data:[{value:888, name:'没有数据！'}]
                    }]
                })
            }
        })
    }

    function show_month() {
        var time = document.getElementById("time").value;
        if(time == null || time == " " || time == ''){
            time = "no";
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
            type:'month'
        })
    })
</script>
</body>
</html>