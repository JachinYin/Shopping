<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2018/5/31
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping</title>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="../../public/static/css/main.css">

    <%
        pageContext.setAttribute("App_Path", request.getContextPath());
    %>

    <style>
        .left {
            float: left;
            position: fixed;
        }

        .right {
            float: right;
        }

        #storeName:hover{
            color: lightgray;
        }

        .shadow {
            box-shadow: 0 0 5px lightgrey;
        }

        .panel-body {
            height: 42%;
        }

        .panel-body:hover {
            box-shadow: 0 0 15px lightgrey;
        }
    </style>


</head>
<body>
<%-- 书籍详情模态框 --%>
<div class="modal fade" id="bookDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="bookModalName"></h4>
            </div>
            <div class="modal-body" id="bookModalBody">
                <%--body--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="addToCar btn btn-primary" id="modalAddToCartBtn">加入购物车</button>
            </div>
        </div>
    </div>
</div>

<div class="navbar navbar-duomi navbar-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar navbar-duomi navbar-top navbar-header navbar-fixed-top">
            <p style="float: left;">&nbsp&nbsp&nbsp&nbsp&nbsp</p>
            <img src="../../public/images/logo.jpg" width="50" class="img-circle" style="float: left;">
            <a class="navbar-brand" href="${App_Path}" id="storeName">
                BootStore&nbsp&nbsp&nbsp&nbsp&nbsp
            </a>
            <form class="navbar-form navbar-left" style="float: right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜书名">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
    </div>
</div>

<div class="container-fluid ">
    <div class="row">
        <table>
            <tr>
                <td>
                    <div class="col-md-2 left">
                        <ul id="main-nav" class="nav nav-tabs nav-stacked">
                            <li>
                                <a href="${App_Path}">
                                    <i class="glyphicon glyphicon-th-large"></i>
                                    &nbsp首页
                                </a>
                            </li>
                            <li>
                                <a href="#bookchoice" class="nav-header collapsed" data-toggle="collapse">
                                    <i class="glyphicon glyphicon-book"></i>
                                    &nbsp书籍
                                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                                </a>
                                <ul id="bookchoice" class="nav nav-list collapse secondmenu" style="height: 0px;">
                                    <li><a href="books/1" class="kind">
                                        <i class="glyphicon glyphicon-tag"></i>&nbspGame</a></li>
                                    <li><a href="books/2" class="kind">
                                        <i class="glyphicon glyphicon-tag"></i>&nbsp哲学</a></li>
                                    <li><a href="books/3" class="kind">
                                        <i class="glyphicon glyphicon-tag"></i>&nbsp诗歌</a></li>
                                    <li><a href="books/4" class="kind">
                                        <i class="glyphicon glyphicon-tag"></i>&nbsp文学</a></li>
                                    <li><a href="books/5" class="kind">
                                        <i class="glyphicon glyphicon-tag"></i>&nbsp科幻</a></li>
                                </ul>
                            </li>
                            <li>
                                <a id="toCart" class="nav-header collapsed" data-toggle="collapse">
                                    <i class="glyphicon glyphicon-shopping-cart"></i>
                                    &nbsp购物车
                                </a>
                            </li>
                            <li>
                                <a id="toOrder" class="nav-header collapsed" data-toggle="collapse">
                                    <i class="glyphicon glyphicon-list-alt"></i>
                                    &nbsp查看订单
                                    <span class="label label-warning pull-right">5</span>
                                </a>
                            </li>
                            <li>
                                <a href="#userinfo" class="nav-header collapsed" data-toggle="collapse">
                                    <i class="glyphicon glyphicon-user"></i>
                                    &nbsp个人信息
                                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                                </a>
                                <ul id="userinfo" class="nav nav-list collapse secondmenu" style="height: 0px;">
                                    <li><a id="getUserInfo"><i class="glyphicon glyphicon-eye-open"></i> 查看信息</a></li>
                                    <li><a id="editUserInfo"><i class="glyphicon glyphicon-edit"></i> 修改信息</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="test">
                                    <i class="glyphicon glyphicon-calendar"></i>
                                    图表统计
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="glyphicon glyphicon-fire"></i>
                                    关于系统
                                </a>
                            </li>
                        </ul>
                    </div>
                </td>
                <td>

                </td>
                <div class="col-md-10 right">
                    <div class="container" id="bookList"></div>
                    <hr>
                    <div class="container">
                        <div class="col-md-6" id="nav-pageInfo">
                        </div>
                        <div class="col-md-6">

                            <nav aria-label="Page navigation">
                                <ul class="pagination" id="nav-page">

                                </ul>
                            </nav>

                        </div>
                    </div>
                </div>
            </tr>
        </table>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        toPage(1, "1");
    });

    function toPage(pn, kind) {
        $("#nav-page").attr("kind", kind);
        $.ajax({
            url: "books/" + kind,
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                build_books(result);
                build_page_info(result);
                build_page_nvag(result);
            }
        });
    }

    function build_books(result) {
        $("#bookList").empty();

        var books = result.extendInfo.pageInfo.list;

        // 页面显示的书籍
        $.each(books, function (index, book) {

            var Panbody = $("<div class='panel-body'></div>");

            //TODO 图片连接
            var info_image = $("<img class='shadow' style='width: 100px;'>").attr("src", "../../public/images/" + book.cover);
            var info_bookName = ($("<h3 id='bookName' data-toggle='tooltip'" +
                " data-placement='left' title='点击查看详情'>" + book.name + "</h3>")
                .attr({
                    bookId: book.bookid, name: book.name, intro: book.intro, author: book.author
                    , price: book.price, cover: book.cover, inventory: book.inventory
                }));
            var info_intro = $("<p>" + book.intro.substring(0, 27) + "...</p>");
            // 加入购物车的按钮
            var button_add = $("<a class='addToCar btn btn-primary' " +
                "role='button'>加入购物车</a>")
                .attr("bookid", book.bookid);
            var info_price = $("<h5 class='text-warning' style='float:right;'>价格：￥"
                + book.price + "&nbsp&nbsp&nbsp</h5>");

            Panbody.append(info_image)
                .append(info_bookName)
                .append(info_intro)
                .append($("<p></p>")
                    .append(button_add)
                    .append(info_price)
                );

            var Panel = $("<div class='panel panel-default'></div>").append(Panbody);
            var divEle = $("<div class='col-md-3'></div>").append(Panel);

            $("[data-toggle='tooltip']").tooltip();


            $("#bookList").append(divEle);

        });

        // 为元素 加入按钮 添加事件,定义在此处可以同时监听模态框中的原有元素和动态加载处理的元素
        $(".addToCar").click(function () {
            var bookId = $(this).attr("bookid");
            $.ajax({
                url: "cart/" + bookId,
                type: "POST",
                success: function (result) {
                    if (result.statusCode == 100) {
                        alert(result.info);
                    } else {
                        alert(result.info);
                    }
                }

            });
        });

        $(document).on("click", "h3", function () {

            bookDetail($(this));

            $("#bookDetail").modal({
                backdrop: "static"
            })
        });
        $(document).on("mouseover mouseout", "h3", function (e) {
            if (e.type == "mouseover")
                $(this).attr("style", "color:darkgoldenrod");
            if (e.type == "mouseout")
                $(this).attr("style", "");
        });

        // 模态框的详情页
        function bookDetail(h3) {
            var image_modal = "../../public/images/" + h3.attr("cover");
            $("#bookModalName").empty();
            $("#bookModalBody").empty();
            $("#bookModalName").append("<span>" + h3.attr("name") + "</span>");
            $("#bookModalBody")
                .append($("<img class='shadow' style='width: 150px;'>").attr("src", image_modal))
                .append($("<p class='text-muted'>作者：" + h3.attr("author") + "</p>"))
                .append($("<p class='text-info'>简介：" + h3.attr("intro") + "</p>"))
                .append($("<p class='text-warning'>价格：" + h3.attr("price") + " &nbsp &nbsp 库存：" + h3.attr("inventory") + "</p>"));
            $("#modalAddToCartBtn").attr("bookid", h3.attr("bookid"));
        }

    }

    // 分页信息
    function build_page_info(result) {
        // 清空数据
        $("#nav-pageInfo").empty();
        var pageInfoNode = result.extendInfo.pageInfo;
        $("#nav-pageInfo").append("当前第 " + pageInfoNode.pageNum + " 页. " +
            "总共 " + pageInfoNode.pages + " 页. " +
            "一共 " + pageInfoNode.total + " 条记录");
        currtentPage = pageInfoNode.pageNum
    }

    // 分页条
    function build_page_nvag(result) {
        $("#nav-page").empty();
        var temp = result.extendInfo.pageInfo;

        var ulNode = $("#nav-page");

        // 首页节点 和 前一页节点
        var firstPageNode = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageNode = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (!temp.hasPreviousPage) {
            firstPageNode.addClass("disabled");
            prePageNode.addClass("disabled");
        } else {
            // 为节点添加点击事件
            firstPageNode.click(function () {
                toPage(1, ulNode.attr("kind"));
            });
            prePageNode.click(function () {
                toPage(temp.prePage, ulNode.attr("kind"));
            });
        }

        ulNode.append(firstPageNode).append(prePageNode);
        $.each(temp.navigatepageNums, function (index, item) {
            var numNode = $("<li></li>").append($("<a></a>").append(item));
            if (temp.pageNum == item) numNode.addClass("active");
            numNode.click(function () {
                toPage(item, ulNode.attr("kind"));
            });
            ulNode.append(numNode);
        });

        var nextPageNode = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageNode = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
        if (!temp.hasNextPage) {
            nextPageNode.addClass("disabled");
            lastPageNode.addClass("disabled");
        } else {
            // 为节点添加点击事件
            lastPageNode.click(function () {
                toPage(temp.pages, ulNode.attr("kind"));
            });
            nextPageNode.click(function () {
                toPage(temp.nextPage, ulNode.attr("kind"));
            });
        }

        ulNode.append(nextPageNode).append(lastPageNode);
    }

    //分类
    $(".kind").click(function () {
        var kind = $(this).attr("href").substring(6, 7);
        toPage(1, kind);
        return false;
    });

    // 查看购物车
    $("#toCart").click(function () {
        toCart();

        function toCart() {
            $.ajax({
                url: "cart",
                type: "GET",
                success: function (result) {
                    buildCart(result);
                }
            });
        }

        function buildCart(result) {
            $("#bookList").empty();
            $("#nav-pageInfo").empty();
            $("#nav-page").empty();

            var carts = result.extendInfo.cartInfo;

            // 购物车标题
            {
                var rowHeader = $("<div class='row'></div>")
                    .append($("<div class='col-md-6'></div>"))
                    .append($("<h1>购物车</h1>"));
                $("#bookList").append(rowHeader);
            }

            // 操作
            {
                var funRowELe = $("<div class='row'></div>")
                    .append($("<div class='col-md-12 col-md-offset-10'></div>"))
                    .append($("<button class='btn btn-primary' id='btn_addOrder'>下单</button>")).append($("<span>&nbsp</spqn>"))
                    .append($("<button class='btn btn-danger' id='btn_delete_all'>清空</button>"));
                $("#bookList").append(funRowELe);

                $("#btn_addOrder").click(function () {
                    alert("Order");
                });
                $("#btn_delete_all").click(function () {
                    $.ajax({
                        url: "cart",
                        type: "DELETE",
                        success: function (result) {
                            toCart();
                        }
                    });
                });


            }
            // 购物车表格
            {
                var rowTab = $("<div class='row'></div>")
                    .append($("<div class='col-md-6'></div>"));

                var thubEle = $("<div class='thumbnail'></div>").append("<br>");

                var tableEle = $("<table class='table table-hover table-striped'></table>");
                var headEle = $("<tr><th>#</th><th>cover</th><th>name</th>" +
                    "<th>count</th><th>price</th><th>total price</th>" +
                    "<th>Operation</th></tr>");
                tableEle.append(headEle);
                // 显示购物车表格
                $.each(carts, function (index, item) {
                    var trEle = $("<tr></tr>");
                    var imgEle = $("<td></td>").append($("<img style='width: 30px;height: 30px'>")
                        .attr("src", "../../public/images/" + item.book.cover));
                    var nameEle = $("<td></td>").append(item.book.name);
                    var countEle = $("<td></td>").append(item.count);
                    var priveEle = $("<td>￥</td>").append(item.book.price);
                    var totalPriveEle = $("<td>￥</td>").append(item.price);
                    var btn_edit = $("<button type='button' class='btn btn-info'>" +
                        "修改数量</button>");
                    var btn_del = $(" <button type='button' class='btn btn-danger'>" +
                        "删除</button>");

                    // 修改数量事件
                    btn_edit.click(function () {
                        var str_count = prompt("请输入数量", item.count);
                        var reg = /^[0-9]*$/;
                        if (reg.test(str_count)) {
                            $.ajax({
                                url: "cart",
                                data: "cartid=" + item.cartid +
                                "&count=" + str_count +
                                "&bookid=" + item.book.bookid,
                                type: "PUT",
                                success: function (result) {
                                    toCart();
                                }
                            });
                        } else {
                            alert("请输入正确整数！");
                            alert("cartid=" + item.cartid +
                                "&count=" + str_count +
                                "&bookid=" + item.bookId);
                        }
                    });
                    // 删除单项事件
                    btn_del.click(function () {
                        alert(item.cartid);
                        $.ajax({
                            url: "cart/" + item.cartid,
                            type: "DELETE",
                            success: function (result) {
                                toCart();
                            }
                        });
                    });

                    trEle.append(index + 1).append(imgEle).append(nameEle)
                        .append(countEle).append(priveEle).append(totalPriveEle)
                        .append(btn_edit).append(btn_del);

                    tableEle.append(trEle);
                });

                thubEle.append(tableEle);
                thubEle.appendTo(rowTab);

                $("#bookList").append(rowTab);

            }

        }
    });

    // 查看用户
    $("#getUserInfo").click(function () {
        toUser();

        function toUser() {
            $.ajax({
                url: "user",
                type: "GET",
                success: function (result) {
                    buildUser(result);
                }
            });
        }

        function buildUser(result) {
            $("#bookList").empty();
            $("#nav-pageInfo").empty();
            $("#nav-page").empty();

            var user = result.extendInfo.userInfo;

            // 用户界面标题
            {
                var rowHeader = $("<div class='row'></div>")
                    .append($("<div class='col-md-6'></div>"))
                    .append($("<h1></h1>").append(user.account + "的信息"));
                $("#bookList").append(rowHeader);
            }
            // 用户界面显示
            {
                var divPanel = $("<div class='panel panel-info'></div>");
                var divPanHead = $("<div class='panel-heading'></div>")
                    .append($("<h2 class='panel-title'></h2>")
                        .append("<span class='glyphicon glyphicon-user'> 我的信息</span>"));
                var divPanBody = $("<div class='panel-body'></div>");

                var formEle = $("<form class='form-horizontal'></form>");
                var accountEle = $("<div class='form-group'></div>")
                // 标签
                    .append($("<label class='col-sm-4 control-label'>账号:</label>"))
                    // 静态控件
                    .append($("<div class='col-sm-8'></div>")
                        .append($("<p class='form-control-static'></p>")
                            .append(user.account)));
                var nameEle = $("<div class='form-group'></div>")
                // 标签
                    .append($("<label class='col-sm-4 control-label'>姓名:</label>"))
                    // 静态控件
                    .append($("<div class='col-sm-8'></div>")
                        .append($("<p class='form-control-static'></p>")
                            .append(user.name)));
                var phoneEle = $("<div class='form-group'></div>")
                // 标签
                    .append($("<label class='col-sm-4 control-label'>手机:</label>"))
                    // 静态控件
                    .append($("<div class='col-sm-8'></div>")
                        .append($("<p class='form-control-static'></p>")
                            .append(user.phone)));
                var genderEle = $("<div class='form-group'></div>")
                // 标签
                    .append($("<label class='col-sm-4 control-label'>性别:</label>"))
                    // 静态控件
                    .append($("<div class='col-sm-8'></div>")
                        .append($("<p class='form-control-static'></p>")
                            .append(user.gender)));
                var uidEle = $("<div class='form-group'></div>")
                // 标签
                    .append($("<label class='col-sm-4 control-label'>UID:</label>"))
                    // 静态控件
                    .append($("<div class='col-sm-8'></div>")
                        .append($("<p class='form-control-static'></p>")
                            .append(user.userid)));

                formEle.append(accountEle)
                    .append(nameEle)
                    .append(phoneEle)
                    .append(genderEle)
                    .append(uidEle);
                divPanBody.append(formEle);

                divPanel.append(divPanHead).append(divPanBody);
                $("#bookList").append(divPanel);
            }

        }
    });

    // 修改用户
    $("#editUserInfo").click(function () {
        editUser();

        function editUser() {
            $.ajax({
                url: "user",
                type: "GET",
                success: function (result) {
                    buildUser(result);
                }
            });
        }

        function buildUser(result) {
            $("#bookList").empty();
            $("#nav-pageInfo").empty();
            $("#nav-page").empty();

            var user = result.extendInfo.userInfo;

            // 修改界面标题
            {
                var rowHeader = $("<div class='row'></div>")
                    .append($("<div class='col-md-6'></div>"))
                    .append($("<h1></h1>").append(user.account + " 的信息"));
                $("#bookList").append(rowHeader);
            }
            // 用户界面显示
            {
                var divPanel = $("<div class='panel panel-info'></div>");
                var divPanHead = $("<div class='panel-heading'></div>")
                    .append($("<h2 class='panel-title'></h2>")
                        .append("<span class='glyphicon glyphicon-user'> 我的信息</span>"));
                var divPanBody = $("<div class='panel-body'></div>");

                var formEle = $("<form id='editUserForm' class='form-horizontal'></form>");
                var accountEle = $("<div class='form-group'></div>")
                // 标签
                    .append($("<label class='col-sm-4 control-label'>账号:</label>"))
                    // 控件
                    .append($("<div class='col-sm-4'></div>")
                        .append($("<input type='text' class='form-control' name='account'>")
                            .attr("value", user.account)));
                var nameEle = $("<div class='form-group'></div>")
                // 标签
                    .append($("<label class='col-sm-4 control-label'>姓名:</label>"))
                    // 控件
                    .append($("<div class='col-sm-4'></div>")
                        .append($("<input type='text' class='form-control' name='name'>")
                            .attr("value", user.name)));
                var phoneEle = $("<div class='form-group'></div>")
                // 标签
                    .append($("<label class='col-sm-4 control-label'>手机:</label>"))
                    // 控件
                    .append($("<div class='col-sm-4'></div>")
                        .append($("<input type='text' class='form-control' name='phone'>")
                            .attr("value", user.phone)));

                var genderMale = $("<input type='radio' name='gender' value='男'>");
                var genderFemale = $("<input type='radio' name='gender' value='女'>");
                if ("男" == user.gender) {
                    genderMale.attr("checked", "checked");
                } else {
                    genderFemale.attr("checked", "checked");
                }
                var genderEle = $("<div class='form-group'></div>")
                // 标签
                    .append($("<label class='col-sm-4 control-label'>性别:</label>"))
                    // 控件
                    .append($("<div class='col-sm-4'></div>")
                        .append($("<label class='radio-inline'></label>")
                            .append(genderMale)
                            .append("男"))
                        .append($("<label class='radio-inline'></label>")
                            .append(genderFemale)
                            .append("女")));
                var submit = $("<div class='form-group'></div>")
                // 控件
                    .append($("<div class='col-sm-offset-4 col-sm-2'>")
                        .append($("<button id='editUserBtn' type='button' class='btn btn-info form-control'>保存</button>")));

                formEle.append(accountEle)
                    .append(nameEle)
                    .append(phoneEle)
                    .append(genderEle)
                    .append(submit);
                divPanBody.append(formEle);

                divPanel.append(divPanHead).append(divPanBody);
                $("#bookList").append(divPanel);
            }

        }

        $(document).on("click", "#editUserBtn", function () {
            var info = $("#editUserForm").serialize();
            $.ajax({
                url: "user",
                data: info,
                type: "PUT",
                success: function (result) {
                    editUser();
                }
            });
        });
    });
</script>

</body>
</html>
