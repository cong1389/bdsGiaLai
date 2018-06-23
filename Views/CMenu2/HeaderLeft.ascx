<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
%>

<ul class="top-left fl">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++)
      {%>
    <li><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %> </a></li>
    <%} %>
</ul>
