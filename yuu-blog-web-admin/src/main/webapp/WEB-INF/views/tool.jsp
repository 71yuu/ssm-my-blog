<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/13
  Time: 19:44
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Yuu Blog | 常用工具</title>
    <meta name="description" content="这是一个 tool 页面">
    <meta name="keywords" content="tool">
    <jsp:include page="../includes/head.jsp"/>
    <link rel="stylesheet" href="/static/assets/plugins/treeTable/themes/vsStyle/treeTable.min.css" />
</head>

<body data-type="tool">
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
                            <div class="widget-title  am-cf">常用工具</div>


                        </div>
                        <div class="widget-body  am-fr">
                            <div class="am-u-sm-12">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="treeTable">
                                    <thead>
                                    <tr>
                                        <th>工具名称</th>
                                        <th>链接地址</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${toolList}" var="tool">
                                        <tr id="${tool.id}" pId="${tool.pid}">
                                            <td>${tool.tname}</td>
                                            <td>${tool.link}</td>
                                            <td>
                                                <div class="tpl-table-black-operation">
                                                    <c:if test="${tool.id != 1}">
                                                        <a href="/tool/form?id=${tool.id}"><i class="am-icon-pencil"></i> 编辑</a>&nbsp;&nbsp;&nbsp;
                                                        <button type="button" onclick="confirm('/tool/delete?id=${tool.id}')" class="am-btn-sm am-btn-danger"><i class="am-icon-trash" ></i> 删除</button>&nbsp;&nbsp;&nbsp;
                                                    </c:if>
                                                    <c:if test="${tool.link == '#'}">
                                                        <a href="/tool/form?pid=${tool.id}" type="button" class="tpl-table-black-operation"> <i class="am-icon-trash"></i> 添加下级工具</a>
                                                    </c:if>
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
<!-- TreeTable -->
<script src="/static/assets/plugins/treeTable/jquery.treeTable.min.js"></script>
<!-- dialog -->
<script src="/static/assets/js/amazeui.dialog.min.js"></script>

<!-- TreeTable -->
<script>
    $(function () {
        $("#treeTable").treeTable({
            column:0,
            expandLevel:1
        });
    });

</script>

<script>

    function confirm(url) {
        AMUI.dialog.confirm({
            title: '删除工具',
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