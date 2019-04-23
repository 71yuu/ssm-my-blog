<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/15
  Time: 15:53
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Yuu Blog | 文章管理</title>
    <meta name="description" content="这是一个 article 页面">
    <meta name="keywords" content="article">
    <!-- DataTables -->
    <link rel="stylesheet" href="/static/assets/css/amazeui.datatables.min.css"/>
    <jsp:include page="../includes/head.jsp"/>
</head>

<body data-type="article">
<script src="/static/assets/js/theme.js"></script>
<div class="am-g tpl-g">
    <!-- 头部 -->
    <jsp:include page="../includes/header.jsp"/>
    <!-- 侧边导航栏 -->
    <jsp:include page="../includes/left.jsp"/>

    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">
        <div class="row-content am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title  am-cf">文章列表</div>


                        </div>
                        <div class="widget-body  am-fr">
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                <div class="am-form-group">
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a href="/article/form" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form class="am-form" method="get" action="/article/search" >
                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        <select id="cid" name="cid" data-am-selected="{btnSize: 'sm'}">
                                            <option value="0">所有分类</option>
                                            <c:forEach items="${columnList}" var="column">
                                                <option value="${column.id}" ${cid == column.id ? "selected" : ""}>${column.cname}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " id="key" name="key" value="${key}">
                                        <span class="am-input-group-btn">
                                        <button id="btn" class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="submit"></button>
                                        </span>
                                    </div>
                                </div>
                            </form>

                            <div class="am-u-sm-12">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="articleTable">
                                    <thead>
                                    <tr>
                                        <th>文章标题</th>
                                        <th>作者</th>
                                        <th>时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- more data -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="../includes/footer.jsp"/>
<!-- dialog -->
<script src="/static/assets/js/amazeui.dialog.min.js"></script>
<!-- Datatables -->
<script src="/static/assets/js/amazeui.datatables.min.js"></script>
<!-- DateTime -->
<script src="/static/assets/app/datetime.js"></script>
<script>
    function confirm(url) {
        AMUI.dialog.confirm({
            title: '删除专栏',
            content: '你，确定要删除吗？',
            onConfirm: function() {
                window.location.href = url;
            },
            onCancel: function() {

            }
        });
    }

    $(function() {
        $('#articleTable').DataTable({
            // 是否开启本地分页
            "paging": true,
            // 是否开启本地排序
            "ordering": false,
            // 是否显示左下角信息
            "info": true,
            // 是否允许用户改变表格每页显示的记录数
            "lengthChange": false,
            // 是否显示处理状态(排序的时候，数据很多耗费时间长的话，也会显示这个)
            "processing": true,
            // 是否允许 DataTables 开启本地搜索
            "searching": false,
            // 是否开启服务器模式
            "serverSide": true,
            // 控制 DataTables 的延迟渲染，可以提高初始化的速度
            "deferRender": true,
            // 增加或修改通过 Ajax 提交到服务端的请求数据
            "ajax": {
                "url": "/article/page",
                "data":function (d) {
                    d.cid = $("#cid").val();
                    d.key = $("#key").val();
                }
            },
            // 保存状态
            "stateSave": true,
            // 设置列的数据源
            "columns": [
                {"data": "aname"},
                {"data": "author"},
                {
                    "data": function (row, type, val, meta) {
                        return DateTime.format(row.updated, "yyyy-MM-dd HH:mm:ss");
                    }
                },
                {
                    "data": function (row, type, val, meta) {
                        return ' <div class="tpl-table-black-operation">\n' +
                            '<a href="/article/form?id='+ row.id +'">\n' +
                            '<i class="am-icon-pencil"></i> 编辑\n' +
                            '</a>\n' +
                            '<button onclick="confirm(\'/article/delete?id='+ row.id +'\')" class="am-btn-sm am-btn-danger">\n' +
                            '<i class="am-icon-trash"></i> 删除\n' +
                            '</button>\n' +
                            '</div>'
                    }
                }
            ]
        });
    });

    $("#btn").bind("click", function () {
        $("#articleTable").dataTable().fnDraw(false);
    });
</script>
</body>

</html>