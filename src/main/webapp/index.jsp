
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%--<base href="<%=basePath%>"/>--%>
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
<div class="login-logo"><h1>IWATER</h1></div>
<div class="login-box">
    <form class="layui-form layui-form-pane" action="">

        <h3>登录你的帐号</h3>
        <label class="login-title" for="username">帐号</label>
        <div class="layui-form-item">
            <label class="layui-form-label login-form"><i class="iconfont">&#xe6b8;</i></label>
            <div class="layui-input-inline login-inline">
                <input type="text" name="username" id="username" lay-verify="required" placeholder="请输入你的帐号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <label class="login-title" for="password">密码</label>
        <div class="layui-form-item">
            <label class="layui-form-label login-form"><i class="iconfont">&#xe82b;</i></label>
            <div class="layui-input-inline login-inline">
                <input type="password" name="password" id="password" lay-verify="required" placeholder="请输入你的密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="form-actions">
            <button class="btn btn-warning pull-right" lay-submit lay-filter="login"  type="submit">登录</button>
            <div class="forgot"><a href="#" class="forgot">忘记帐号或者密码</a></div>
        </div>
    </form>

</div>
<script>
    $(function  () {
        var save = '';
            $.get('userController/checkSave.ajax',function (re) {
                var re  = JSON.parse(re);
                if (!(re == null || re =='unsave')){
                    $("#username").val(re.username);
                    $("#password").val(re.password);
                }
            });

        layui.use('form', function(){
            var form = layui.form();
            //监听提交
            form.on('submit(login)', function(data){
                data.field.save = save;
                console.log(data.field);
                $.ajax({
                    url:'userController/login.ajax',
                    data:data.field,
                    type:'post',
                    dataType:'text',
                    success:function (re) {
                        switch (re) {
                            case 'ERROR':
                                alert('帐号不对');
                                break;
                            case 'PDERROR':
                                alert('密码不对');
                                break;
                            case 'SUCCESS':
                                location.href='/home.jsp';
                                break;
                            default:
                                break;
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

    /*function removeMe(){
        if($("#save_me").prop("checked")){

        }else{
            $.ajax({
                url : 'userController/forgetsave.ajax',
                data : {},
                type : 'get',
                dataType : 'text',
                success : function(result) {

                },
                error : function() {
                    $("#save_me").attr("checked","checked");
                }
            });
        }
    }*/

</script>
</body>
</html>