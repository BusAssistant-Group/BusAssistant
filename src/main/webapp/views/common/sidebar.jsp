<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<div class="flex-2">
    <div class="nav">
        <div id="jquery-accordion-menu" class="jquery-accordion-menu white">
            <ul id="demo-list" class="nav-list">
                <div class="logo">
                    BusAssistant
                </div>
                <li><a href="${rootPath}/worker/list"><i class="fa fa-user-plus"></i>员工信息管理</a></li>
                <li class="active"><a href="${rootPath}/car/list"><i class="fa fa-bus"></i>车辆信息管理 </a><span
                        class="jquery-accordion-menu-label">12 </span></li>
                <li><a href="schedual-mng.html"><i class="fa fa-table"></i>排班管理</a>
                    <ul class="submenu">
                        <li><a href="#">服务1 </a></li>
                        <li><a href="#">服务2 </a></li>
                        <li><a href="#">服务3 </a>
                            <ul class="submenu">
                                <li><a href="#">服务4 </a></li>
                                <li><a href="#">服务5 </a></li>
                                <li><a href="#">服务6 </a></li>
                                <li><a href="#">服务7 </a></li>
                            </ul>
                        </li>
                        <li><a href="#">服务8 </a></li>
                    </ul>
                </li>
                <li><a href="${rootPath}/user/linestation"><i class="fa fa-level-up"></i>线路与站点管理</a></li>
                <li><a href="${rootPath}/user/linemanage"><i class="fa fa-bar-chart"></i>统计分析</a></li>
                <li><a href="system-mng.html"><i class="fa fa-cogs"></i>系统管理</a></li>
            </ul>
            <div class="jquery-accordion-menu-footer">
                Footer
            </div>
        </div>
    </div>

    <div class="clearfix"></div>
</div>