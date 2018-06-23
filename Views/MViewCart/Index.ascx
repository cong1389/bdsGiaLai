<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var item = ViewBag.Data as ModOrderEntity ?? new ModOrderEntity();
    var model = ViewBag.Model as MViewCartModel ?? new MViewCartModel();
    var cart = new Cart();
%>

<form method="post" name="cart_form">
    <div class="right_krshop lienhe_kr fr">
        <div class="box_kr padding">
            <div class="title_kr fl">
                <h3><a class="private" href="javascript:void(0);"><%=ViewPage.CurrentPage.Name %></a></h3>
            </div>

            <div class="dangky magin_bot fl">
                <div class="bang">
                    <table cellspacing="0" border="1" style="border-color: #ccc; border-width: 1px; border-style: solid; width: 100%; border-collapse: collapse;">
                        <tbody>
                            <tr class="roll_01">
                                <th>Hình ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th>Xóa</th>
                            </tr>

                            <%
                                long TotalPrice = 0;
                                for (int i = 0; i < cart.Items.Count; i++){
                                    var product = ModProductService.Instance.GetByID(cart.Items[i].ProductID);
                                    if (product == null) continue;

                                    string url = ViewPage.GetURL(product.MenuID, product.Code);
                        
                                    TotalPrice += cart.Items[i].Quantity * product.Price;
                            %>
                            <tr class="roll_01">
                                <td style="width: 10%; text-align: center;"><a href="<%=url %>"><img src="<%=Utils.GetResizeFile(product.File, 2, 55, 0) %>" alt="<%=product.Name %>" width="55" /></a></td>
                                <td style="width: 30%; text-align: left;"><a href="<%=url %>"><%=product.Name %></a></td>
                                <td style="width: 15%; text-align: center;"><%=string.Format("{0:#,##0}", product.Price)%> VNĐ</td>
                                <td style="width: 15%; text-align: center;">
                                    <input type="text" value="<%= cart.Items[i].Quantity %>" name="ArrQuantity" style="text-align: center; border: 1px solid #ccc; height: 20px;" size="4" />
                                </td>
                                <td style="width: 15%; text-align: center;"><%=string.Format("{0:#,##0}", product.Price * cart.Items[i].Quantity)%> VNĐ</td>
                                <td style="width: 5%; text-align: center;"><a href="javascript:void(0)" onclick="confirmZebra('Bạn muốn xóa sản phẩm <%=product.Name %> khỏi giỏ hàng ?','<%=ViewPage.GetURL("gio-hang/Delete")%>/Index/<%=i %>?returnpath=<%=model.returnpath %>');"><img align="absmiddle" src="/Content/skins/images/delete.gif" title="Xóa" alt="Xóa" /></a></td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
                <div class="right_giohang fr">
                    <div class="total fr">Tổng thanh toán: <span><%=string.Format("{0:#,##0}", TotalPrice) %> VNĐ</span></div>
                    <div class="clearfix"></div>

                    <div class="send">
                        <input type="button" value="Thanh toán" onclick="location.href='<%=ViewPage.GetURL("thanh-toan") %>?returnpath=<%=ViewPage.ReturnPath %>'" />
                        <input type="submit" value="Cập nhật số lượng" name="_vsw_action[AddPOST]" />
                        <%if (ViewPage.PageViewState.Exists("returnpath")){%>
                        <input type="button" value="Tiếp tục mua hàng" onclick="location.href='<%=model.returnpath %>'" />
                        <%} %>
                    </div>
                </div>

                <div class="clearfix"></div>
                <div class="dieukhoan">{RS:Cart_Terms}</div>
            </div>
        </div>
    </div>
</form>