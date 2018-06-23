<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModProductEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (page == null) return;
    
    var listChildPage = SysPageService.Instance.GetByParent_Cache(page.ID);
%>

<div class="floor all">
    <div class="fltop all">
        <h3 class="fltitle"><i class="bg_sprivate dt14" style="background:url(<%=page.Icon%>) no-repeat scroll 0 0 rgba(0, 0, 0, 0)"></i><a style="color:#f17837;" href="<%=ViewPage.GetPageURL(page) %>"><%=page.Name %></a></h3>
        <%--<span class="fltitle"><a href="<%=ViewPage.GetPageURL(page) %>"><%=page.Name %></a></span>--%>
        <ul class="flmenu">
            <%for (int i = 0; listChildPage != null && i < (listChildPage.Count > 6 ? 6 : listChildPage.Count); i++){%>
            <li><a href="<%=ViewPage.GetPageURL(listChildPage[i]) %>"><%=listChildPage[i].Name %></a></li>
            <%} %>
            <li class="end"><a href="<%=ViewPage.GetPageURL(page) %>" title="Xem tất cả">Xem tất cả</a></li>
        </ul>
    </div>
    <div class="views_spam all margin-bt">
        <ul class="list_views_spam">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++){
                  string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
            %>
            <li>
                <p class="images">
                    <a href="<%=url%>" title="<%= listItem[i].Name%>">
                        <img src="<%=Utils.GetResizeFile(listItem[i].File, 4, 85, 85)%>" alt="<%=listItem[i].Name%>" />
                    </a>
                </p>
                <h2><a href="<%=url %>" title="<%= listItem[i].Name %>"><%=listItem[i].Name%></a></h2>
                <p class="price-down none"><%=string.Format("{0:#,##0}", listItem[i].Price)%> đ</p>
            </li>
            <%} %>
        </ul>
    </div>
</div>