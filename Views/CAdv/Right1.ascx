<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    if (listItem == null) return;
%>


<div class="quangcao-home">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++)
      {%>
    <%= Utils.GetCodeAdv(listItem[i])%>
    <%} %>
</div>
