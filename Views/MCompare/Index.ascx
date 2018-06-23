<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var listItem = ViewBag.Data as List<ModProductEntity>;
    var model = ViewBag.Model as MCompareModel;
%>

<div class="compare fl">
    <h3><%=ViewPage.CurrentPage.Name %></h3>
    <ul class="list_compare">
        <li class="backg">
            <div class="sizing-div">
                <a class="pnx-btn pnx-btn-nav" href="#">
                    <span class="pnx-btn-text">
                        <i class="pnx-icon-left pnx-icon-arrow-left-alt"></i>Trở về
                    </span>
                </a>
            </div>
        </li>

        <% for (int i = 0; listItem != null && i < listItem.Count; i++){
            string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
            string urlCart = ViewPage.GetURL("gio-hang/Add") + "?ProductID=" + listItem[i].ID + "&Quantity=1&returnpath=" + ViewPage.ReturnPath;
        %>
        <li>
            <div class="sanpham_ss">
                <h5><a href="<%=url %>"><%=listItem[i].Name%></a></h5>
                <div class="mota_ss"><%=listItem[i].Summary%></div>
                <div class="anh_dd">
                    <a href="<%=url %>"><img src="<%=Utils.GetResizeFile(listItem[i].File, 2, 110, 80)%>" alt="<%=listItem[i].Name%>" width="110" height="80" /></a>
                </div>
                <p class="shop-prod-price"><strong><%=string.Format("{0:#,##0}", listItem[i].Price) %> <sup>vnđ</sup></strong></p>
                <div class="product-info-actions pnx-block-1x clearfix">
                    <a class="pnx-btn pnx-btn-primary" href="javascript:void(0);" onclick="location.href='<%=urlCart %>''"><span class="pnx-btn-text">Đặt hàng</span></a>
                    <a href="<%=url %>/t/tai-nguyen" class="product-info-partslist">Tài nguyên</a>
                </div>
                <div class="close_mts"></div>
            </div>
        </li>
        <%} %>

    </ul>

    <div style="clear:both;"></div>

    <div class="bang02">
        <table cellspacing="0" border="1" style="border-color: #ccc; border-width: 1px; border-style: solid; width: 100%; border-collapse: collapse;">
            <tbody>
                <tr class="roll_01_02">
                    <th class="bg_hinhanh">Thông tin chung</th>
                    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
                    <th><%=listItem[i].Model%></th>
                    <%} %>
                </tr>
                <tr class="roll_01_02">
                    <td class="bold">Giá tiền</td>
                    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
                    <td><%=string.Format("{0:#,##0}", listItem[i].Price) %> <sup>vnđ</sup></td>
                    <%} %>
                </tr>
                <tr class="roll_01_02">
                    <td class="bold">Mô tả</td>
                    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
                    <td><%=listItem[i].Summary%></td>
                    <%} %>
                </tr>
                <tr class="roll_01_02">
                    <td class="bold">Tổng quan</td>
                    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
                    <td><%=listItem[i].Description%></td>
                    <%} %>
                </tr>
            </tbody>
        </table>
    </div>

    <div style="clear:both;"></div>

    <ul>
        <li style="width:197px;float:left;">
            <table cellspacing="0" border="1" style="border-color: #ccc; border-width: 1px; border-style: solid; width: 100%; border-collapse: collapse;">
                <tr class="roll_01_02"><th class="bg_hinhanh">Thông tin chi tiết</th></tr>

                <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
                <tr class="roll_01_02"><td class="bold">&nbsp;</td></tr>
                <%} %>
                
            </table>
        </li>

        <% for (int i = 0; listItem != null && i < listItem.Count; i++){
            var listProperty = ModPropertyService.Instance.CreateQuery()
                                        .Where(o => o.ProductID == listItem[i].ID)
                                        .ToList_Cache();       
        %>
        <li style="width:197px;float:left;">
            <table cellspacing="0" border="1" style="border-color: #ccc; border-width: 1px; border-style: solid; width: 100%; border-collapse: collapse;">
                <tr class="roll_01_02"><th><%=listItem[i].Model %></th></tr>

                <%for (int j = 0; listProperty != null && j < listProperty.Count; j++){%>
                <tr class="roll_01_02"><td><%=listProperty[j].getProperty().Name %>: <%=listProperty[j].getPropertyValue().Name %></td></tr>
                <%} %>
                
            </table>
        </li>
        <%} %>

    </ul>
</div>