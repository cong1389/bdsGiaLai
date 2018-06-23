<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
%>
<div class="menu_hot_ul" id="TM_pnMenu" style="display:none">
    <ul>
        <%for (int i = 0; listItem != null && i < listItem.Count; i++)
          {
        %>
         <li><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %></a>
        <%} %>
    </ul>
</div>
