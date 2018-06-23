<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var listPage = SysPageService.Instance.GetByParent_Cache(ViewPage.CurrentPage.ID);
    if (listPage == null) listPage = SysPageService.Instance.GetByParent_Cache(ViewPage.CurrentPage.ParentID);
%>

<%for (int p = 0; listPage != null && p < listPage.Count; p++){
      int menuId = listPage[p].MenuID;
      if (menuId < 1) continue;
      var listItem = ModProductService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("Product", menuId, ViewPage.CurrentLang.ID))
                                    .OrderByDesc(o => o.Order)
                                    .Take(4)
                                    .ToList_Cache();
%>
<%if (listItem != null){%>
<div class="sanpham_c fl">
    <div class="tieude_c">
        <a href="<%=ViewPage.GetPageURL(listPage[p])%>"><%=listPage[p].Name%></a>
        <div class="xemthem_c fr"><a href="<%=ViewPage.GetPageURL(listPage[p])%>">Xem tất cả</a></div>
    </div>

    <ul class="listsp_c fl">
    <%for (int i = 0; i < listItem.Count; i++){
          string _Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
    %>
        <li>
            <div class="middlea">
                <a href="<%=_Url%>">
                    <img src="<%=Utils.GetResizeFile(listItem[i].File, 4, 130, 130)%>" alt="<%=listItem[i].Name%>" />
                </a>
            </div>
            <h4><a href="<%=_Url%>"><%=listItem[i].Name%></a></h4>
            <p class="tinhtrang">Tình trạng: <%=listItem[i].Store ? "Còn hàng" : "Hết hàng"%></p>
            <p class="price"><%if (listItem[i].Price2 > 0){%><%=string.Format("{0:#,##0}", listItem[i].Price2)%> đ<%} %></p>
            <p class="price"><%if (listItem[i].Price > 0){%><span><%=string.Format("{0:#,##0}", listItem[i].Price)%> đ</span><%} %></p>
            <p><input class="btn-order" type="button" value="Mua" onclick="location.href='<%=ViewPage.GetURL("gio-hang/Add") %>?ProductID=<%=listItem[i].ID %>&Quantity=1&returnpath=<%=ViewPage.ReturnPath%>'" /></p>
        </li>
    <%} %>
    </ul>
</div>
<%} %>
<%} %>