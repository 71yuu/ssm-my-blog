<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/15
  Time: 10:11
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Yuu Blog | 专栏管理</title>
    <meta name="description" content="这是一个 column 页面">
    <meta name="keywords" content="column">
    <jsp:include page="../includes/head.jsp"/>
</head>

<body data-type="column">
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
                            <div class="widget-title  am-cf">专栏管理</div>
                        </div>
                        <div class="row am-cf">
                            <div class="am-u-sm-12">
                                <div class="am-form-group">
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a href="/column/form" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </div>
                                    </div>
                                </div>
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                    <thead>
                                    <tr>
                                        <th>专栏封面图</th>
                                        <th>专栏标题</th>
                                        <th>专栏描述</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${columnList}" var="column">
                                        <tr class="gradeX">
                                            <td>
                                                <img src="${column.img}" class="tpl-table-line-img" alt="">
                                            </td>
                                            <td class="am-text-middle">${column.cname}</td>
                                            <td class="am-text-middle">${column.describe}</td>
                                            <td class="am-text-middle">
                                                <div class="tpl-table-black-operation">
                                                    <a href="/column/edit?id=${column.id}">
                                                        <i class="am-icon-pencil"></i> 编辑
                                                    </a>
                                                    <button type="button" onclick="confirm('/column/delete?id=${column.id}')"class="am-btn-sm am-btn-danger">
                                                        <i class="am-icon-trash"></i> 删除
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
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
</script>
</body>

</html>
