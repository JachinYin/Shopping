<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2018/6/1
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>

<style>
    .bg{
        background-image: url("public/images/18001.jpg");
        background-repeat: no-repeat;
    }
</style>
<body>

<%-- 登陆模态框 --%>
<div class="modal fade" tabindex="-1" role="dialog" id="loginModal">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">登陆</h4>
            </div>
            <div class="modal-body">
                <%-- body TODO--%>
                <form class="form-horizontal" method="get" action="home">
                    <div class="form-group">
                        <label for="loginName" class="col-sm-3 control-label">账户</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="loginName" placeholder="UserName" name="account">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="loginPassword" class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="loginPassword" placeholder="Password" name="password">
                            <span class="help-block" id="tips"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="confirmLogin">登陆</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="container">
    <div class="jumbotron">
        <img src="public/images/logo.jpg" alt="" class="img-circle" style="width: 100px;height: 100px">
        <h1>Welcome to BookStore!</h1>
        <p>请先登录</p>
        <p>
            <button id="login" type="button" class="btn btn-info" data-toggle="modal" data-target="#loginModal">
                Login
            </button>
        </p>
    </div>
    <div class="page-header">
        <h1>BookStore <small>Introduction</small></h1>
    </div>
    <div class="container">
        <p>something here.</p>
    </div>
</div>

<script type="text/javascript">
    $("#login").click(function () {
        $("#tips").text("");
    });

    $("#confirmLogin").click(function () {
        var info = $("#loginModal form").serialize();
        $.ajax({
            url:"home2",
            data:info,
            type:"POST",
            success: function (result) {
                if(result.statusCode == 100){
                    window.location.href = "home";
                }else{
                    $("#tips").text("用户名或密码错误");
                    // alert("用户名或密码错误")
                }
            }
        });
    });
</script>


</body>
</html>
