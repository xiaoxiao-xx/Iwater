<%@ page import="com.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <%--<%--%>
        <%--User user = (User) request.getSession().getAttribute("USER");--%>
    <%--%>--%>
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
        <li class="layui-nav-item"><a href="#">会员列表</a></li>
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
                            <input type="text" id="keyword"  placeholder="编号、地址、电话查询" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-input-inline" style="width:80px">
                            <button class="layui-btn" onclick="search()"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </div>
                </div>
            <button class="layui-btn" onclick="member_add('添加会员','customer_add.jsp','600','500')"><i class="layui-icon">&#xe608;</i>添加</button><span class="x-right" style="line-height:40px" id="number_customer">....</span></xblock>
            <div id="list">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>住址</th>
                    <th>电话</th>
                    <th>备注</th>
                    <th>状态</th>
                    <th>加入时间</th>
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
<!-- 背景切换结束 -->
<!-- 页面动态效果 -->
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
            url : 'customerController/getPage.ajax',
            type : 'get',
            data : {
                keyword:keyword
            },
            dataType : 'text',
            success : function(res) {
                var page = JSON.parse(res);
                $("#number_customer").text("共有数据"+page.totalRecords+"条");
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
        $.getJSON('customerController/showlist.ajax',data,function (re){
            $("#ctable").html("");
            $.each(re,function (n,l) {
                var date = formatDate(l.customerTime);
                $("#ctable").append("<tr><td>"+l.customerNum+"</td><td>"+l.customerAddr+"</td><td >"+l.customerTel+"</td><td >"+l.customerOtherinfo+"</td><td >"+l.customerStatu+"</td><td>"+date+"</td><td class=\"td-manage\"><a title=\"编辑\" href=\"javascript:;\" onclick=\"member_edit('编辑','customerController/before_edit.do?id="+l.customerId+"',4,'',510)\" class=\"ml-5\" style=\"text-decoration:none\"><i class=\"layui-icon\">&#xe642;</i></a><a title=\"删除\" href=\"javascript:;\" onclick=\"member_del(this,'"+l.customerId+"')\" style=\"text-decoration:none\"><i class=\"layui-icon\">&#xe640;</i></a></td></tr>\n");
            })

        });
    };
    /*用户-添加*/
    function member_add(title,url,w,h){
        x_admin_show(title,url,w,h);
    }
    // 用户-编辑
    function member_edit (title,url,id,w,h) {
        x_admin_show(title,url,w,h);
    }
    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.post('customerController/deleteCustomer.ajax',{id:id},function(res){
                if(res=="yes"){
                    $(obj).parents("tr").remove();
                    if($("#ctable tr").length<1){
                        pn = pn-1;
                    }
                    getPage();
                    showpage(pn);
                    layer.msg('已删除!', {
                        icon : 1,
                        time : 500
                    });
                    /*location.replace(location.href);*/
                }else{
                    layer.msg('未删除!', {
                        icon : 1,
                        time : 500
                    });

                }
            })
        });
    };

    function search() {
        pn = 1;
        getPage();
        showpage(pn);
        $("#keyword").val("");
    }

    //时间格式转换
    function formatDate(time){
        if(time==null){
            return "日期不详"
        }
        var date = new Date(time);

        var year = date.getFullYear(),
            month = date.getMonth() + 1,//月份是从0开始的
            day = date.getDate(),
            hour = date.getHours(),
            min = date.getMinutes(),
            sec = date.getSeconds();
        var newTime = year + '年' +
            month + '月' +
            day + '日' ;
        /*   hour + ':' +
          min + ':' +
          sec; */

        return newTime;
    }
</script>
</body>
</html>