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
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>

</head>
<body>
<!-- 中部开始 -->
<div class="wrapper">
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <form class="layui-form">
                <div class="layui-form-item">
                    <input type="hidden" name="bucketInOutId" value="${buck.bucketInOutId}">
                    <input type="hidden" name="customerNum" value="${num}">
                    <input type="hidden" name="customerId" value="${id}">
                    <label for="L_num" class="layui-form-label">
                        <span class="x-red">*</span>备注
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_num" name="remarks"
                               autocomplete="off" class="layui-input" value="${buck.remarks}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>喝水品牌
                    </label>
                    <div class="layui-input-inline" >
                        <select name="bucketType" id="">
                            <option value="桶对换">桶对换</option>
                            <option value="无押桶">无押桶</option>
                            <c:forEach items="${goods}" var="go">
                                <option value="${go.goodsName}" class="${go.goodsId}">${go.goodsName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>数量
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="number" name="number" required="" autocomplete="off"
                                class="layui-input" value="0">
                        <div style="position: absolute;top: 10px;left: 120px;z-index: 10000">
                        <span onclick="btn1()" class="btn">+</span>
                        <span onclick="btn2()" class="btn">-</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>押金金额
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="money" name="accountMoney" required=""
                               autocomplete="off" class="layui-input" value="${buck.accountMoney}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" key="set-mine" lay-filter="save" lay-submit>
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
    var count = 0;
    $(function () {
        $('.${cusg.goodsId}').attr("selected","selected");
        layui.use('form', function(){
            var form = layui.form();
            form.render();
            //监听提交
            form.on('submit(save)', function(data){
                var c = $("#number").val();
                if(c < 0 || isNaN(c) || c%1!=0){
                    $("#number").val(1);
                    layer.msg('请一个输入正整数');
                    return;
                }
                console.log(data.field);
                alert(1)
                $.ajax({
                    url:'/bucketController/edit.ajax',
                    data:data.field,
                    type:'post',
                    dataType:'text',
                    success:function (re) {
                        if(re==="yes"){
                            layer.msg('操作成功',{
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
                            layer.msg('操作失败',{
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
function btn1() {
    count +=1;
    $("#number").val(count);
    $("#money").val(count*40);
}
function btn2() {
    count = count>0?count-1:0;
    $("#number").val(count);
    $("#money").val(count*40);
}
</script>
</body>
</html>
