<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
%>

<%--<ul class="menu_bt">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
    <li><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %></a></li>
    <%} %>
</ul>--%>

<%for (int i = 0; listItem != null && i < listItem.Count; i++)
  {
      var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
%><ul class="list_01 fl">
    <li class="private"><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %> </a></li>
    <%if (listChildItem != null)
      {%>
    <%for (int j = 0; j < listChildItem.Count; j++)
      {
          var listChildItem1 = SysPageService.Instance.GetByParent_Cache(listChildItem[j].ID); %>
    <li><a href="<%=ViewPage.GetPageURL(listChildItem[j]) %>"><%=listChildItem[j].Name %></a> </li>
    <%}
      }%>
</ul>
<%}%>
