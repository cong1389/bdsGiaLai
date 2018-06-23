<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (listItem == null || page == null) return;
    string title = ViewBag.Title;
%>

<%--<div class="tintuchot">
    <div class="title">
        <p><a href="<%=ViewPage.GetPageURL(page) %>" title="<%=page.Name %>"><%=title %></a></p>
    </div>
    <ul>
        <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
        <li><a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>" title="<%=listItem[i].Name %>"><%=listItem[i].Name %></a><span><img src="/Content/skins/images/hot.gif" /></span></li>
        <%} %>
    </ul>
</div>
--%>


<div class="box-tin all">
                    <div class="title-1">
                        <div class="dv-ico-1"><i class="ico-sty icon-nhadat"></i></div>
                        <div class="dv-ct-tabs-1"> <a href="<%=ViewPage.GetPageURL(page) %>" class="a-title" title="<%=page.Name %>"><%=title %></a> </div>
                    </div>
                    <div class="list-dmtt">
                        <ul class="list_tieubieu">
                             <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
        <li><a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>" title="<%=listItem[i].Name %>"><%=listItem[i].Name %></a><span><img src="/Content/skins/images/hot.gif" alt=" <%=listItem[i].Name %>" /></span></li>
        <%} %> 
                              <li><a href="<%=ViewPage.GetPageURL(page) %>" title="Xem Thêm <%=page.Name %>">Xem thêm >> </a></li>
                        </ul>
                    </div>
                </div>