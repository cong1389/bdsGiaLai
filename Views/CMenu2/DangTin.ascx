<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<SysPageEntity>;
    //if (listItem == null) return;
%>

<div class="other-box fr">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++)
          {%>
    <a href="<%=ViewPage.GetPageURL(listItem[i]) %>" class="link-box link0<%=i+1 %>" rel="nofollow"><span></span><strong><%=listItem[i].Name %></strong></a>
        <%} %>
</div>
