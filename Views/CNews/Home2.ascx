<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (listItem == null || page == null) return;
    string title = ViewBag.Title;
    var count = listItem.Count(); 
%>
<div class="news-list-border-background all mb15">
    <ul class="news-list-thumb all" id="listnewshomeimg" style="max-height:165px;overflow:hidden;">
           <%for (int i = 0; listItem != null && i < listItem.Count; i++)
              {%>
        <li>
            <a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>">
                <img class="imagethumbnail" src="<%= Utils.GetResizeFile(listItem[i].File, 2, 240, 124)%>" alt="<%=listItem[i].Name %>" style="float:left;">
            </a>
            <div class="thumb-title">
                <a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>"><%=listItem[i].Name %></a>
            </div>
            <div class="thumb-summary">
               <%=listItem[i].Summary %>
            </div>
        </li>
         <%} %>
    </ul>
    <div class="news-slide-show-item all">
        <ul class="news-list all" id="listnewshome">
               <%for (int i = 1; listItem != null && i < listItem.Count; i++)
              {%>
            <li><a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>" title="<%=listItem[i].Name %>"><%=listItem[i].Name %></a></li>
            <%} %>
              <li><a href="<%=ViewPage.GetURL(listItem[0].MenuID, listItem[0].Code)%>" title="<%=listItem[0].Name %>"><%=listItem[0].Name %></a></li>
        </ul>
    </div>
</div>
