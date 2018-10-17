<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link rel="stylesheet" href="./css/kkpager_blue.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="./js/kkpager.min.js"></script>
    <script src="./js/vue.js"></script>


</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="./home.jsp">IWATER V1.0</a></div>
    <div class="open-nav"><i class="iconfont">&#xe699;</i></div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item"><a href="#">水票充值</a></li>
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
            <!-- 右侧内容框架，更改从这里开始 -->
                <div class="layui-form-pane" style="text-align: center;">
                    <div class="layui-form-item" style="display: inline-block;">
                        <div class="layui-input-inline">
                            <input type="text" id="keyword"  placeholder="名称查询" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-input-inline" style="width:80px">
                            <button class="layui-btn" onclick="search()"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </div>
                </div>
            <div id="list">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>地址</th>
                    <th>电话</th>
                    <th>票数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="ctable">
                </tbody>
            </table>
            </div>
            <!-- 分页部分 -->
            <div id="kkpager"></div>
            <!-- end 分页 -->
            <!-- 右侧内容框架，更改从这里结束 -->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<script>
    /*ajax获取分页数据*/
    var pn = 1;
    var keyword = "";
    $(function () {
        getPage();
        showpage(pn);
    });
    function getPage() {
        keyword = $("#keyword").val();
        $.ajax({
            url : 'ticketController/getPage.ajax',
            type : 'get',
            data : {
                keyword:keyword
            },
            dataType : 'text',
            success : function(res) {
                var page = JSON.parse(res);
                $("#number_goods").text("共有数据"+page.totalRecords+"条");
                //初始化分页插件
                kkpager.generPageHtml({
                    pno : pn,
                    mode : 'click', //设置为click模式
                    //总页码
                    total : page.total,
                    //总数据条数
                    totalRecords : page.totalRecords,
                    //点击页码、页码输入框跳转、以及首页、下一页等按钮都会调用click
                    //适用于不刷新页面，比如ajax
                    click : function(n) {
                        //这里可以做自已的处理
                        showpage(n);
                        pn = n;
                        //处理完后可以手动条用selectPage进行页码选中切换
                        this.selectPage(n);
                    },
                    //getHref是在click模式下链接算法，一般不需要配置，默认代码如下
                    getHref : function(n) {
                        return '#';
                    }

                },true);
            },
            error : function() {

            }
        });
    };

    //显示分页记录
    function showpage(pn) {
        var data = {
            pn:pn,
            keyword : keyword
        };
        $.getJSON('ticketController/showlist.ajax',data,function (re){
            $("#ctable").html("");
            $.each(re,function (n,l) {
                $("#ctable").append("<tr><td>"+l.customerNum+"</td><td>"+l.customerAddr+"</td><td >"+l.customerTel+"</td><td >"+l.waterTicketCount+"</td><td><a title=\"充值\" href=\"javascript:;\" onclick=\"changeTicket('"+l.waterTicketId+"','"+l.customerNum+"')\" class=\"btn layui-btn-small\" style=\"text-decoration:none\">充值</a></td></tr>\n");
            })

        });
    };

    /*用户-删除*/
    function changeTicket(id,num){
        layer.open({
            id:1,
            type: 1,
            title:'充值水票',
            skin:'layui-layer-rim',
            area:['450px', 'auto'],

            content: "<div class=\"layui-form-item\">\n" +
                "                    <label for=\"L_addr\" class=\"layui-form-label\">\n" +
                "                        <span class=\"x-red\">*</span>水票数量\n" +
                "                    </label>\n" +
                "                    <div class=\"layui-input-inline\">\n" +
                "                        <input type=\"number\" id=\"L_ticket\" required=\"\"\n" +
                "                               value='11' class=\"layui-input\">\n" +
                "                    </div>\n" +
                "                </div>\n"+
                "<div class=\"layui-form-item\">\n" +
                        "                    <label for=\"L_addr\" class=\"layui-form-label\">\n" +
                    "                        <span class=\"x-red\">*</span>金额\n" +
                    "                    </label>\n" +
                    "                    <div class=\"layui-input-inline\">\n" +
                    "                        <input type=\"number\" id=\"L_money\" required=\"\"\n" +
                    "                               value='0' class=\"layui-input\">\n" +
                    "                    </div>\n" +
                    "                </div>"
            ,
            btn:['充值','取消'],
            btn1: function (index,layero) {
                var ticket = $("#L_ticket").val();
                var money = $("#L_money").val();
                var data={
                    id:id,
                    num:num,
                    ticket:ticket,
                    money:money
                }
                if (! (isNaN(ticket))) {
                    $.post('ticketController/recharge.ajax',data,function (re) {
                        if(re==="yes"){
                            layer.msg('充值成功',{
                                icon : 1,
                                time : 500
                            },function () {
                                layer.close(index);
                                getPage();
                                showpage(pn);
                            });
                        }else{
                            layer.msg('充值失败',{
                                icon : 2,
                                time : 500
                            },function () {
                                layer.close(index);
                            });
                        }
                    })
                }else {
                    layer.msg('请输入数字',{
                        time:500
                    })
                    console.log(ticket);
                }
            },
            btn2:function (index,layero) {
                layer.close(index);
            }

        });
    };

    function search() {
        pn = 1;
        getPage();
        showpage(pn);
        $("#keyword").val("");
    }
</script>
</body>
</html>