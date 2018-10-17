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
    <script type="text/javascript" src="./js/vue.js"></script>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="./home.jsp">IWATER V1.0</a></div>
    <div class="open-nav"><i class="iconfont">&#xe699;</i></div>
    <ul class="layui-nav right" lay-filter="">
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
        <div class="content" id="app">
            <blockquote class="layui-elem-quote">
                通过客户编号、电话、地址的快捷查询
            </blockquote>
            <!-- 右侧内容框架，更改从这里结束 -->
            <div class="layui-form-pane" style="text-align: center;">
                <div class="layui-form-item" style="display: inline-block;">
                    <div class="layui-input-inline">
                        <input type="text" id="keyword" v-model="key"  placeholder="快捷查询" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn" v-on:click="search()"><i class="layui-icon">&#xe615;</i></button>
                    </div>
                </div>
            </div>
                <table class="layui-table">
                    <thead style="display: none">
                    <tr>
                        <th>编号</th>
                        <th>地址</th>
                        <th>电话</th>
                        <th>品牌</th>
                        <th>水票</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tr v-for="re in result">
                        <td>{{re.customerNum}}</td>
                        <td>{{re.customerAddr}}</td>
                        <td>{{re.customerTel}}</td>
                        <td>{{re.goods_name}}</td>
                        <td>{{re.waterTicketCount}}</td>
                        <td>{{re.customerOtherinfo}}</td>
                        <td><a title="编辑" href="javascript:;" v-on:click="member_edit('编辑','waterSaleController/before_edit.do?id='+re.customerId,4,510)" class="btn">添加售水记录</a></td>
                    </tr>
                    <tbody id="ctable">
                    </tbody>
                </table>
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 背景切换结束 -->
<script>
    /*function search() {
        var key = $("#keyword").val();
        $.getJSON('userController/search.ajax',{key:key},function (re) {
            console.log(re);
        })
    }*/
    var app = new Vue({
        el:'#app',
        data:{
            key:'',
            result:[]
        },
        methods:{
            search:function () {
                $("thead").show();
                this.result=[];
                var _this = this;
                $.getJSON('userController/search.ajax',{key:this.key},function (re) {
                    for (var i = 0; i <re.length ; i++) {
                        _this.result.push(re[i]);
                    }
                })
            },
            member_edit (title,url,id,w,h) {
                x_admin_show(title,url,w,h);
            }
        }
    });
</script>
</body>
</html>