<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
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
<!-- 中部开始 -->
<div class="wrapper">
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content" id="good">
            <!-- 右侧内容框架，更改从这里开始 -->
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>商品
                    </label>
                    <div class="layui-input-inline">
                        <select id="goodType" name="goodsId">
                            <option disabled>请选择商品</option>
                            <c:forEach items="${goods}" var="go">
                                <option value="${go.goodsId}">${go.goodsName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_num" class="layui-form-label">
                        <span class="x-red">*</span>数量
                    </label>
                    <div class="layui-input-inline">
                        <input type="hidden" name="buyInId" value="${id}">
                        <input type="number" id="L_num" name="buyNum" required=""
                               autocomplete="off" class="layui-input" value="${buyIn.buyNum}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_addr" class="layui-form-label">
                        <span class="x-red">*</span>金额
                    </label>
                    <div class="layui-input-inline">
                        <input type="number" id="L_addr" name="buyMoney" required=""
                               autocomplete="off" class="layui-input" value="${buyIn.buyMoney}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button  class="layui-btn" lay-filter="add" lay-submit="">
                        保存
                    </button>
                </div>
            </form>
            <!-- 右侧内容框架，更改从这里结束 -->
        </div>
    </div>
    <!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
<script>
$(function () {
    event.preventDefault();
    layui.use('form', function(){
        var form = layui.form();
        form.render("select");
        //监听提交
        form.on('submit(add)', function(data){
            var s = $("select option:selected").text();
            data.field.goodsName = s;
            $.ajax({
                url:'buyInController/edit.ajax',
                data:data.field,
                type:'post',
                dataType:'text',
                success:function (re) {
                    if(re==="yes"){
                      layer.msg('修改成功',{
                          icon : 1,
                          time : 500
                      },function () {
                          // 获得frame索引
                          var index = parent.layer.getFrameIndex(window.name);
                          //关闭当前frame
                          parent.layer.close(index);
                          parent.location.reload();

                      });
                    }else{
                        layer.msg('修改失败',{
                            icon : 2,
                            time : 500
                        });
                    }
                },
                error:function () {
                    alert('异常')
                }

            });
            return false;
        });
    });
});

</script>
</body>
</html>
