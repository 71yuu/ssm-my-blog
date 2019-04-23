<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/19
  Time: 8:33
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a id="top"></a>
<nav style="min-height: 0px;">
    <div class="nav-bar nav--absolute nav--transparent" data-fixed-at="200">
        <div class="nav-module logo-module left">
            <a href="/index">
                <span class="logo logo-dark">Yuu Blog</span>
                <span class="logo logo-light">Yuu Blog</span>
            </a>
        </div>
        <div class="nav-module menu-module left">
            <ul class="menu">

                <li>
                    <a href="/dynamic/" style="color: #232323;">
                        博客动态
                    </a>
                </li>
                <li>
                    <a href="#" style="color: #232323;">
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