<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModProductEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (page == null) return;
    string title = ViewBag.Title;
%>

<div class="list-saledb all">
    <ul class="list-saledb-tabs tabfooter">
        <li class="active"><a href="<%=ViewPage.GetPageURL(page) %>"><%=title %></a></li>
    </ul>
    <div class="list_sptieubieu sanpham_footer">
        <ul class="sp sanpham5" id="list-slide">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++){
                  string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
            %>
            <li>
                <p class="image">
                    <a href="<%=url %>" title="<%= listItem[i].Name %>">
                        <img src="<%=Utils.GetResizeFile(listItem[i].File, 4, 165, 165)%>" alt="<%=listItem[i].Name%>" />
                    </a>
                </p>
                <h2><a href="<%=url %>" title="<%= listItem[i].Name %>"><%=listItem[i].Name%></a></h2>
                <p class="price-down"><%=string.Format("{0:#,##0}", listItem[i].Price) %> đ</p>
            </li>
            <%} %>
        </ul>
        <p class="pre" id="slide-prev"><a href="javascript:void(0)" rel="nofollow">Previous</a></p>
        <p class="next" id="slide-next"><a href="javascript:void(0)" rel="nofollow">Next</a></p>
    </div>
</div>