<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<div class="quangcao fr">
                   <%for (int i = 0; listItem != null && i < listItem.Count; i++)
      {%>
    <a href="<%=ViewPage.GetURL(listItem[i].AdvCode) %>">
        <%= Utils.GetCodeAdv(listItem[i])%>
    </a>
    <%} %>
                </div>