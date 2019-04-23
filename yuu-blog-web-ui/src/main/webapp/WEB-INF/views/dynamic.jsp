<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/19
  Time: 8:22
--%>
<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/10
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head lang="zh-CN">
    <title>Yuu Blog | 博客动态</title>
    <!-- head -->
    <jsp:include page="../includes/head.jsp"/>
</head>
<body class="scroll-assist">

<!-- nav -->
<jsp:include page="../includes/nav.jsp"/>

<div class="main-container">
    <section class="height-50 page-title page-title--animate">
        <div class="container pos-vertical-center">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h1>博客动态</h1>
                    <p class="lead">已发表 ${articleNum} 篇博文</p>
                </div>
            </div>
            <!--end row-->
        </div>
        <!--end container-->
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="masonry masonry-blog">
                    <div class="masonry__container masonry--animate masonry--active" style="position: relative; height: 1923.56px;">

                        <c:forEach items="${articleList}" var="article">
                            <div class="col-md-4 col-sm-6 masonry__item" style="position: absolute; left: 0px; top: 0px;">
                                <a href="/article/${article.aname}">
                                    <div class="card card-4">
                                        <div class="card__body boxed boxed--sm bg--white">
                                            <h6>
                                                ${article.cname}
                                            </h6>
                                            <div class="card__title">
                                                <h5>${article.aname}</h5>
                                            </div>
                                            <hr>
                                            <div class="card__lower">
                                                <span>by</span>
                                                <span class="h6">${article.author}</span>
                                                <span>on</span>
                                                <span class="h6"><fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>

                    </div>
                    <!--end masonry container-->
                </div>
                <!--end masonry-->
            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </section>

    <jsp:include page="../includes/footer.jsp"/>
</div>

</body>

