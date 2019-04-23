<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/13
  Time: 19:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="left-sidebar">
    <!-- 菜单 -->
    <ul class="sidebar-nav">
        <li class="sidebar-nav-link">
            <a href="/home" class="active">
                <i class="am-icon-y-combinator-square sidebar-nav-link-logo"></i> 控制面板
            </a>
        </li>
        <li class="sidebar-nav-link">
            <a href="javascript:;" class="sidebar-nav-sub-title">
                <i class="am-icon-home sidebar-nav-link-logo"></i> 首页管理
                <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
            </a>
            <ul class="sidebar-nav sidebar-nav-sub">
                <li class="sidebar-nav-link">
                    <a href="/tool/list">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 常用工具
                    </a>
                </li>

                <li class="sidebar-nav-link">
                    <a href="/main/img">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 背景图片
                    </a>
                </li>

                <li class="sidebar-nav-link">
                    <a href="/main/banner">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 标语
                    </a>
                </li>
            </ul>
        </li>
        <li class="sidebar-nav-link">
            <a href="/column/list">
                <i class="am-icon-columns sidebar-nav-link-logo"></i> 专栏管理
            </a>
        </li>
        <li class="sidebar-nav-link">
            <a href="/article/list">
                <i class="am-icon-book sidebar-nav-link-logo"></i> 文章管理
            </a>
        </li>
    </ul>
</div>