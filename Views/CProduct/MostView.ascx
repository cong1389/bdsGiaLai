<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModProductEntity>;
    //string title = ViewBag.Title;
    //var page = ViewBag.Page as SysPageEntity ?? new SysPageEntity();
%>

<div class="box_kr private0004">
    <h2><a href="<%=ViewPage.GetURL("san-pham-xem-nhieu") %>">sản phẩm xem nhiều</a></h2>
    <ul class="list_left">
        <%for (int i = 0; listItem != null && i < listItem.Count; i++){
              string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);      
        %>
        <li>
            <div class="outera">
                <a href="<%=url%>"><img src="<%=Utils.GetResizeFile(listItem[i].File, 4, 138, 138)%>" alt="<%=listItem[i].Name%>" /></a>
            </div>
            <h4 class="private0003"><a class="private0002" href="<%=url%>"><%=listItem[i].Name%></a></h4>
            <p class="mota"><%=listItem[i].Summary%></p>
            <p class="price">Lượt xem: <span><%=string.Format("{0:#,##0}", listItem[i].View)%></span></p>
            <p class="price">Giá: <span><%=string.Format("{0:#,##0}", listItem[i].Price)%> vnđ</span></p>
        </li>
        <%} %>
    </ul>
    <div class="xemthem"><a href="<%=ViewPage.GetURL("san-pham-xem-nhieu") %>">Xem thêm</a></div>
</div>