﻿<%@ Control Language="C#" AutoEventWireup="true" %>
<ul id="menu">
    <li class="node"><a href="/CP/">Home</a>
    <li class="node"><a>{RS:MenuTop_Management}</a>
        <ul>
            <% var listModule = VSW.Lib.Web.Application.CPModules.Where(o => o.ShowInMenu == true).OrderBy(o => o.Order).ToList(); %>
            <%for (int i = 0;listModule != null && i < listModule.Count; i++)
              { %>
            <li><a class="<%=listModule[i].CssClass%>" href="/{CPPath}/<%=listModule[i].Code%>/Index.aspx"><%=listModule[i].Name%></a></li>
            <%} %>
        </ul>
    </li>
   
    <li class="node"><a>{RS:MenuTop_Design}</a>
        <ul>
            <li><a class="icon-16-menu" href="/{CPPath}/SysPage/Index.aspx">{RS:MenuTop_Page}</a></li>
            <li><a class="icon-16-themes" href="/{CPPath}/SysTemplate/Index.aspx">{RS:MenuTop_Template}</a></li>
            <li><a class="icon-16-module" href="/{CPPath}/SysSite/Index.aspx">Site</a></li>
        </ul>
    </li>
    <li class="node"><a>Hệ thống</a>
        <ul>
            <li><a class="icon-16-category" href="/{CPPath}/SysMenu/Index.aspx">Chuyên mục</a></li>
            <li><a class="icon-16-groups" href="/{CPPath}/SysRole/Index.aspx">Nhóm người sử dụng</a></li>
            <li><a class="icon-16-user" href="/{CPPath}/SysUser/Index.aspx">Người sử dụng</a></li>
            <li><a class="icon-16-language" href="/{CPPath}/SysResource/Index.aspx">Tài nguyên</a></li>
            <li><a class="icon-16-info" href="/{CPPath}/SysUserLog/Index.aspx">Nhật ký đăng nhập</a></li>
        </ul>
    </li>

    <li class="node"><a>Cá nhân</a>
        <ul>
            <li><a class="icon-16-component" href="/{CPPath}/UserChangePass.aspx">Thay đổi mật khẩu</a></li>
            <li><a class="icon-16-component" href="/{CPPath}/UserChangeInfo.aspx">Thay đổi thông tin</a></li>
        </ul>
    </li>
</ul>