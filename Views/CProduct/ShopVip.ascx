<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModProductEntity>;
    string title = ViewBag.Title;
%>

<h3><%=title %></h3>
<div class="sanpham_shopvip">
    <ul class="sp sanpham2" id="list-shopvip">
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
    <p class="pre" id="shopvip-prev"><a href="javascript:void(0)" rel="nofollow">Previous</a></p>
    <p class="next" id="shopvip-next"><a href="javascript:void(0)" rel="nofollow">Next</a></p>
</div>