<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<div class="quangcao all">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
    <%= Utils.GetCodeAdv(listItem[i])%>
    <%} %>
</div>