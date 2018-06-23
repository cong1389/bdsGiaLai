<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;

%>


    <%for (int i = 0; listItem != null && i < listItem.Count; i++)
      {%>
    <li><a class="menu-hori-title" href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %> </a></li>
    <%} %>

