<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModTagEntity>;
%>

<div class="c-tags">
    Xu hướng tìm kiếm: 
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
    <a href="<%=ViewPage.GetURL("tags/" + listItem[i].Code) %>"><%=listItem[i].Name %></a> | 
    <%} %>
</div>
