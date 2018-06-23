<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<SysPageEntity>;
    string title = ViewBag.Title;
%>

<div class="webpart margin_bt fl">
    <div class="left_webpart">
        <div class="wrap_left_webpart">
            <h2><a href="javascript:void(0)" rel="nofollow"><%=title %></a></h2>
            <ul class="list_tk">
                <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
                <li><a href="<%=ViewPage.GetPageURL(listItem[i]) %>" title="<%=listItem[i].Name %>"><%=listItem[i].Name %></a></li>
                <%} %>
            </ul>
        </div>
    </div>
</div>