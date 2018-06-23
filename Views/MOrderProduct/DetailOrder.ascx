<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var model = ViewBag.Model as ModOrderModel;
    var item = ViewBag.Data as ModOrderEntity;
    var product = ModProductService.Instance.GetByID(item.ProductID);
    if (product == null) return;
%>


<form id="DetailOrder_Form" name="DetailOrder_Form" method="post">

<div id="element-box">
         <h2><a href="javascrip:voi(0);" class="a-titledetail">Chi Tiết Dơn Hàng! </a></h2>
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        
        <fieldset class="detailform">
            <legend>THÔNG TIN ĐƠN HÀNG</legend>
            <table class="detailtable">
                <tr>
                    <td class="key">
                        <label>Trạng thái:</label>
                    </td>
                    <td>
                        <select name="StatusID" id="StatusID" class="text_input">
                            <option value="0">-</option>
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
                            <%= string.Format("{0:#,##0}", product.Price * item.Quantity)%> VNĐ
                            -
                            <%=ReadPrice.ConvertNumberToText(product.Price * item.Quantity) %>
                        </label>
                    </td>
                </tr>
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
                    <tr class="row1">
                        <td align="center">
                            <%= 1%>
                        </td>
                        <td>
                            <%= product.Name%>
                        </td>
                        <td align="center">
                            <%= product.Model%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", product.Price)%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", item.Quantity)%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", product.Price * item.Quantity)%> VNĐ
                        </td>
                        <td align="center">
                            <%=GetName(product.getMenu())%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" align="right">
                            Tổng tiền
                        </td>
                        <td align="center" colspan="2">
                            <%= string.Format("{0:#,##0}", product.Price * item.Quantity)%> VNĐ
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
                <tr>
                    <td class="key">
                        <label>Địa chỉ :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingAddress %></label>
                    </td>
                </tr>
                <tr>
                    <td class="key">
                        <label>Điện thoại :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingPhone %></label>
                    </td>
                </tr>
                <tr>
                    <td class="key">
                        <label>Email :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingEmail%></label>
                    </td>
                </tr>
                <tr>
                    <td class="key">
                        <label>Tiêu đề :</label>
                    </td>
                    <td>
                        <label style="width:90%;"><%=item.BillingTitle %></label>
                    </td>
                </tr>
                <%if (!string.IsNullOrEmpty(item.BillingContent)){%>
                <tr>
                    <td class="key">
                        <label>Ghi chú :</label>
                    </td>
                    <td>
                        <p style="width:90%;"><%=item.BillingContent.Replace("\n", "<br />")%></p>
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