<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ModAutoLinksService.Instance.CreateQuery()
                                .Where(o => o.Activity == true)
                                .OrderByDesc(o => o.ID)
                                .ToList_Cache();
%>

<span>
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
    <a href="<%=listItem[i].Link %>" target="_blank" title="<%=listItem[i].Title %>"><%=listItem[i].Name %></a> <%if(i < listItem.Count - 1) {%>|<%} %>
    <%} %>
</span>