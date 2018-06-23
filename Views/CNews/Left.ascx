<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (listItem == null || page == null) return;
    string title = ViewBag.Title;
%>

<div class="sanphambanchay">
    <div class="title">
        <p><a href="<%=ViewPage.GetPageURL(page) %>" title="<%=page.Name %>"><%=title %></a></p>
    </div>
    <ul>
        <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
        <li><a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>" title="<%=listItem[i].Name %>"><%=listItem[i].Name %></a></li>
        <%} %>
    </ul>
</div>