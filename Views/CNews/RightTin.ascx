<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (listItem == null || page == null) return;
    string title = ViewBag.Title;
%>




<div class="box-tin all">
    <div class="title-1">
        <div class="dv-ico-1"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs-1"><a class="a-title" title="<%=page.Name %>" href="<%=ViewPage.GetPageURL(page) %>"><%=title %></a> </div>
         </div>
    <div class="list-dmtt">
        <ul class="list_new">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++)
              {%>

            <li>
                <a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>" title="<%=listItem[i].Name %>">
                    <img src="<%= Utils.GetResizeFile(listItem[i].File, 2, 79, 59)%>"  alt="<%=listItem[i].Name %>"></a>
                <a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>" title="<%=listItem[i].Name %>"><%=listItem[i].Name %></a>
            </li>
            <%} %>
              <li><a href="<%=ViewPage.GetPageURL(page) %>" title="Xem Thêm <%=page.Name %>">Xem thêm >> </a></li>
        </ul>
    </div>
</div>
