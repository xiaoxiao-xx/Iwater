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
                <input type="hidden" name="goodsId" value="${good.goodsId}">
                <div class="layui-form-item">
                    <label for="L_num" class="layui-form-label">
                        <span class="x-red">*</span>名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_num" name="goodsName" required=""
                               autocomplete="off" class="layui-input" value="${good.goodsName}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_addr" class="layui-form-label">
                        <span class="x-red">*</span>进价
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_addr" name="goodsIn" required=""
                               autocomplete="off" class="layui-input" value="${good.goodsIn}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_tel" class="layui-form-label">
                        <span class="x-red">*</span>卖价
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_tel" name="goodsOut" required=""
                               autocomplete="off" class="layui-input" value="${good.goodsOut}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_info" class="layui-form-label">
                        <span class="x-red">*</span>规格
                    </label>
                    <div class="layui-input-inline">
                        <input type="radio" name="goodsSpecs" value="大桶" title="大桶">
                        <input type="radio" name="goodsSpecs" value="小桶" title="小桶">
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
    $(function () {
        $("input[value='${good.goodsSpecs}']").attr("checked","checked");
        layui.use('form', function(){
            var form = layui.form();
            //监听提交
            form.on('submit(save)', function(data){
                $.ajax({
                    url:'/goodsController/edit.ajax',
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
