<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<ul class="nganhang" id="adv.partner">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
    <li><%= Utils.GetCodeAdv(listItem[i])%></li>
    <%} %>
</ul>