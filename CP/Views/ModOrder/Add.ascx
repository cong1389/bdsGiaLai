<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as ModOrderModel;
    var item = ViewBag.Data as ModOrderEntity;

    var listOrderDetail = item.getOrderDetail();
 %>

<form id="vswForm" name="vswForm" method="post">
<input type="hidden" id="_vsw_action" name="_vsw_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%= GetListCommand("apply|Lưu,save|Lưu  &amp; đóng,space,cancel|Đóng")%>
        </div>
        <div class="pagetitle icon-48-mediamanager">
            <h2>Đơn hàng <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<div class="clr"></div>

<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        
        <fieldset class="adminform">
            <legend>THÔNG TIN ĐƠN HÀNG</legend>
            <table class="admintable">
                <tr>
                    <td class="key">
                        <label>Trạng thái:</label>
                    </td>
                    <td>
                        <select name="StatusID" id="StatusID" class="text_input">
                            <option value="0">-</option>
                            <%= Utils.ShowDDLMenuByType2("Status", model.LangID, item.StatusID)%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="key">
                        <label>Mã đơn hàng :</label>
                    </td>
                    <td>
                        <label><%=item.Code %></label>
                    </td>
                </tr>
                <tr>
                    <td class="key">
                        <label>Tổng tiền :</label>
                    </td>
                    <td>
                        <label style="width:90%;">
                            <%= string.Format("{0:###,##0}", item.Total)%> VNĐ
                            -
                            <%=ReadPrice.ConvertNumberToText(item.Total) %>
                        </label>
                    </td>
                </tr>

                <%--<tr>
                    <td class="key">
                        <label>Thanh toán :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.Payment == 1 ? "Nhận hàng tại VP Tobuy" : (item.Payment == 2 ? "Giao hàng tận nơi" : (item.Payment == 3 ? "Thanh toán ATM nội địa" : "Không rõ"))%></label>
                    </td>
                </tr>
                <%if (item.Payment == 3){%>
                <tr>
                    <td class="key">
                        <label>Xuất hóa đơn :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=!string.IsNullOrEmpty(item.ShippingName) ? "Có" : "Không"%></label>
                    </td>
                </tr>
                <%} %>
                <%if (item.Payment == 3 && !string.IsNullOrEmpty(item.ShippingName)){%>
                <tr>
                    <td class="key">
                        <label>Tên công ty :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.ShippingName%></label>
                    </td>
                </tr>
                <tr>
                    <td class="key">
                        <label>Địa chỉ công ty :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.ShippingAddress%></label>
                    </td>
                </tr>
                <tr>
                    <td class="key">
                        <label>Mã số thuế :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.ShippingPhone%></label>
                    </td>
                </tr>
                <%} %>--%>


                <tr>
                    <td class="key">
                        <label>IP :</label>
                    </td>
                    <td>
                        <label><%=item.IP %></label>
                    </td>
                </tr>
                <tr>
                    <td class="key">
                        <label>Ngày mua :</label>
                    </td>
                    <td>
                        <label><%=string.Format("{0:HH:mm - dd/MM/yyyy}", item.Created) %></label>
                    </td>
                </tr>
            </table>
        </fieldset>

        <fieldset class="adminform">
            <legend>SẢN PHẨM MUA</legend>
            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="1%">
                            #
                        </th>
                        <th nowrap="nowrap">
                            Tên sản phẩm
                        </th>
                        <th nowrap="nowrap">
                            Mã sản phẩm
                        </th>
                        <th nowrap="nowrap">
                            Giá khuyến mại
                        </th>
                        <th nowrap="nowrap">
                            Giá bán
                        </th>
                        <th nowrap="nowrap">
                            Số lượng
                        </th>
                        <th nowrap="nowrap">
                            Thành tiền
                        </th>
                        <th nowrap="nowrap">
                            Chuyên mục
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%for (int i = 0; listOrderDetail != null && i < listOrderDetail.Count; i++){
                        var product = ModProductService.Instance.GetByID(listOrderDetail[i].ProductID);
                        if (product == null)
                            continue;
                    %>
                    <tr class="row<%= i%2 %>">
                        <td align="center">
                            <%= i + 1%>
                        </td>
                        <td>
                            <%= product.Name%>
                        </td>
                        <td align="center">
                            <%= product.Model%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", product.Price2)%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", product.Price)%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", listOrderDetail[i].Quantity)%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", product.Price2 * listOrderDetail[i].Quantity)%>
                        </td>
                        <td align="center">
                            <%=GetName(product.getMenu())%>
                        </td>
                    </tr>
                    <%} %>
                    <tr>
                        <td colspan="6" align="right">
                            Tổng tiền
                        </td>
                        <td align="center" colspan="2">
                            <%=string.Format("{0:###,###}", item.Total) %> VNĐ
                        </td>
                    </tr>
                </tbody>
            </table>
        </fieldset>
        
        <fieldset class="adminform">
            <legend>THÔNG TIN NGƯỜI MUA</legend>
            <table class="adminlist" cellspacing="1">
                <tr>
                    <td class="key">
                        <label>Họ và tên :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingName %></label>
                    </td>
                </tr>
                <%--<tr>
                    <td class="key">
                        <label>Địa chỉ :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingAddress %></label>
                    </td>
                </tr>--%>
                <tr>
                    <td class="key">
                        <label>Điện thoại :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingPhone %></label>
                    </td>
                </tr>
                <%--<tr>
                    <td class="key">
                        <label>Di động :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingMobile %></label>
                    </td>
                </tr>--%>
                <tr>
                    <td class="key">
                        <label>Email :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingEmail%></label>
                    </td>
                </tr>
                <%--<tr>
                    <td class="key">
                        <label>Tiêu đề :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingTitle %></label>
                    </td>
                </tr>--%>
                <%if (!string.IsNullOrEmpty(item.Content)){%>
                <tr>
                    <td class="key">
                        <label>Ghi chú :</label>
                    </td>
                    <td>
                        <p style="width:90%;"><%=item.Content.Replace("\n", "<br />")%></p>
                    </td>
                </tr>
                <%} %>
            </table>
        </fieldset>  
                        
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>