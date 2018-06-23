<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    string title = ViewBag.Title;
    //var page = ViewBag.Page as SysPageEntity ?? new SysPageEntity();
%>

<div class="box-filter">
    <h3><%=title %></h3>
    <div class="list_product">
        <ul>
        <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
            <li><a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>"><%=listItem[i].Name%></a></li>
        <%} %>
        </ul>
    </div>
</div>