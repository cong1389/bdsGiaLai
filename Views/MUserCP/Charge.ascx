<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var item = WebLogin.CurrentUser ?? new ModWebUserEntity();
    var listWebUserCharge = ViewBag.WebUserCharge as List<ModWebUserChargeEntity>;
%>

<div class="title">
    <h2>Lịch sử nạp thẻ</h2>
</div>
<div class="list_sp_ngang">
    <div class="col-contact">
        <div class="list_dangky fl">
            <table class="p-cart-order">
                <tbody>
                    <tr class="bg-th">
                        <th width="162">Nhà mạng</th>
                        <th width="368">Mênh giá thẻ</th>
                        <th width="141">Tỷ lệ</th>
                        <th width="134">Số điểm</th>
                        <th width="129">Ngày nạp</th>
                    </tr>
                    
                    <%for (int i = 0; listWebUserCharge != null && i < listWebUserCharge.Count; i++){%>
                    <tr>
                        <td>
                            <%=listWebUserCharge[i].Operator%>
                        </td>
                        <td>
                            <p class="price3"><%=string.Format("{0:#,##0}", listWebUserCharge[i].Value)%> đ</p>
                        </td>
                        <td>
                            x<%=listWebUserCharge[i].Rating%>
                        </td>
                        <td>
                            <p class="price3"><%=string.Format("{0:#,##0}", listWebUserCharge[i].Point)%></p>
                        </td>
                        <td>
                            <%=string.Format("{0:dd/MM/yyyy HH:mm}", listWebUserCharge[i].Created) %>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
</div>
