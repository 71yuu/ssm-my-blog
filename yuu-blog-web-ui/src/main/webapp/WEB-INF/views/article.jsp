<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/19
  Time: 23:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head lang="zh-CN">
    <title>Yuu Blog | ${article.aname}</title>
    <jsp:include page="../includes/head.jsp"/>
</head>
<body class="scroll-assist">
<jsp:include page="../includes/nav.jsp"/>

<div class="main-container">
    <section class="height-40">
        <div class="container pos-vertical-center">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h2>${article.aname}</h2>
                    <span>
                        <em>${article.author} 发表于 <fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd"/> </em>
                    </span>
                </div>
            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </section>

    <section class="bg--secondary">

        <div class="container post">
            <div class="row">
                <div class="col-sm-12">
                    ${article.html}
                </div>
            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </section>

    <jsp:include page="../includes/footer.jsp"/>
</div>

</body>


