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
                <input type="hidden" name="customerId" value="${cus.customerId}">
                <div class="layui-form-item">
                    <label for="L_num" class="layui-form-label">
                        <span class="x-red">*</span>编号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_num" name="customerNum" required=""
                               autocomplete="off" class="layui-input" value="${cus.customerNum}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_addr" class="layui-form-label">
                        <span class="x-red">*</span>住址
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_addr" name="customerAddr" required=""
                               autocomplete="off" class="layui-input" value="${cus.customerAddr}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_tel" class="layui-form-label">
                        <span class="x-red">*</span>电话
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_tel" name="customerTel" required=""
                               autocomplete="off" class="layui-input" value="${cus.customerTel}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_tel" class="layui-form-label">
                        <span class="x-red">*</span>商品
                    </label>
                    <div class="layui-input-inline">
                        <select id="section_good" name="goodsId" lay-filter="goodsId">请选择商品
                            <option disabled>请选择商品</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>备注
                    </label>
                    <div class="layui-input-inline">
                        <textarea  name="customerOtherinfo" required="" autocomplete="off" class="layui-textarea" >${cus.customerOtherinfo}</textarea>

                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>状态
                    </label>
                    <div class="layui-input-inline">
                        <input type="radio" name="customerStatu" value="活跃" title="活跃">
                        <input type="radio" name="customerStatu" value="不活跃" title="不活跃">
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
        $("input[value='${cus.customerStatu}']").attr("checked","checked");
        $("input[value='${cg}']").attr("selected","selected");
        var oldId = '${cg}';
        $.getJSON('../customerController/getLastNum.ajax',function (re) {
            $.each(re.goods,function (n,val) {
                if (val.goodsId=='${cg}'){
                    $("#section_good").append("<option value='"+val.goodsId+"' selected>"+val.goodsName+"["+val.goodsSpecs+"]</option>");
                }else{
                    $("#section_good").append("<option value='"+val.goodsId+"'>"+val.goodsName+"["+val.goodsSpecs+"]</option>");

                }
            });
        layui.use('form', function(){
            var form = layui.form();
            form.render();
            //监听提交
            form.on('submit(save)', function(data){
                if (oldId == data.field.goodsId) {
                    data.field.oldId = "nochange";
                }else if(oldId=="not") {
                    data.field.oldId = "new";
                }else {
                    data.field.oldId = "changed";
                }
                $.ajax({
                    url:'/customerController/edit.ajax',
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
    });

</script>
</body>
</html>
