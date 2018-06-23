<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    if (listItem == null) return;
%>

<ul class="slide" id="list_news">
    <%for(int i = 0; i < listItem.Count; i++){
        string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
    %>
    <li>
        <a href="<%=url %>" title="<%=listItem[i].Name %>">
            <img src="<%= Utils.GetResizeFile(listItem[i].File, 2, 550, 328)%>" width="550" height="328" alt="<%= listItem[i].Name %>" />
        </a>
        <div class="onslide">
            <a href="<%=url %>" title="<%=listItem[i].Name %>">
                <%= listItem[i].Name %>
            </a>
        </div>
    </li>
    <%} %>
</ul>