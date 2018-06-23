<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>;
   string title = ViewBag.Title;
%>
<div class="centification">
    <p><%=title %></p>
    <%for (int i = 0; listItem != null && i < listItem.Count; i++)
      {%>
    <%= Utils.GetCodeAdv(listItem[i])%>
    <%} %>
</div>
