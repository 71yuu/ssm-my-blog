<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/17
  Time: 12:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="zh-CN">
    <title>Yuu Blog | ${main.h1}</title>
    <jsp:include page="../includes/head.jsp"/>
</head>
<body class="scroll-assist">
<a id="top"></a>
<nav style="min-height: 0px;">
    <div class="nav-bar nav--absolute nav--transparent" data-fixed-at="200">
        <div class="nav-module logo-module left">
            <a href="/index">
                <span class="logo logo-dark">Yuu Blog</span>
                <span class="logo logo-light" style="color: #FFF;">Yuu Blog</span>
            </a>
        </div>
        <div class="nav-module menu-module left">
            <ul class="menu">

                <li>
                    <a href="/dynamic/">
                        博客动态
                    </a>
                </li>

                <li>
                    <a href="#">
                        常用工具
                    </a>
                    <ul>
                        <c:forEach items="${toolDtos}" var="tool">
                            <li class="dropdown">
                                <a href="${tool.link}">${tool.tname}</a>
                                <ul>
                                    <c:forEach items="${tool.tools}" var="item">
                                        <li>
                                            <a href="${item.link}" target="_blank">
                                                    ${item.tname}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>
                </li>

            </ul>
        </div>
        <!--end nav module-->
    </div>
    <!--end nav bar-->
    <div class="nav-mobile-toggle visible-sm visible-xs">
        <i class="icon-Align-Right icon icon--sm"></i>
    </div>
</nav>
<div class="main-container">
    <section class="height-100 imagebg cover cover-4 parallax" data-overlay="3">
        <div class="background-image-holder background--bottom" style="transform: translate3d(0px, 0px, 0px); background: url(&quot;/static/assets/img/code.png&quot;); opacity: 1; top: 0px; height: 969px;">
            <img alt="image" src="${main.img}">
        </div>
        <div class="container pos-vertical-center">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h1>
                        ${main.h1}
                    </h1>
                    <p class="lead">
                        ${main.h2}
                        <br> ${main.h3}
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text-center">
                    <h3>Yuu Blog</h3>
                    <p class="lead">
                        ${main.h4}
                    </p>
                </div>
            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </section>

    <section class="blog-snippet-1">
        <div class="container">
            <div class="row">

                <c:forEach items="${columnList}" var="column">
                    <div class="col-md-4 col-sm-6">
                        <a href="/column/${column.cname}">
                            <div class="card card-3">
                                <div class="card__image">
                                    <img alt="Pic" src="${column.img}">
                                </div>
                                <div class="card__body boxed bg--white">
                                    <div class="card__title">
                                        <h5>${column.cname}</h5>
                                    </div>
                                    <span>
                                            <em>${column.describe}</em>
                                        </span>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>

            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </section>

    <jsp:include page="../includes/footer.jsp"/>
</div>

</body>
</html>