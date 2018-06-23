<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var item = ViewBag.Data as ModOrderEntity ?? new ModOrderEntity();
    var cart = new Cart();
%>

<form method="post" name="checkout_form">
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
                                <td style="width: 45%; text-align: left;min-width:510px;"><a href="<%=url %>"><%=product.Name %></a></td>
                                <td style="width: 15%; text-align: center;"><%=string.Format("{0:#,##0}", product.Price)%> VNĐ</td>
                                <td style="width: 15%; text-align: center;">
                                    <input type="text" value="<%= cart.Items[i].Quantity %>" name="ArrQuantity" style="text-align: center; border: 1px solid #ccc; height: 20px;" size="4" />
                                </td>
                                <td style="width: 15%; text-align: center;"><%=string.Format("{0:#,##0}", product.Price * cart.Items[i].Quantity)%> VNĐ</td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
                <div class="right_giohang fr">
                    <div class="total fr">Tổng thanh toán: <span><%=string.Format("{0:#,##0}", TotalPrice) %> VNĐ</span></div>
                    <div class="clearfix"></div>
                </div>

                <div class="clearfix"></div>
            </div>

            <div class="contact_left fl">
                <p class="title_contact">Vui lòng diền thông tin vào form bên dưới, dấu <span>(*)</span> là bắt buộc.</p>
                <div class="fieldwrapper">
                    <label class="styled">Họ và tên <span style="color: red">(*)</span></label>
                    <div class="thefield">
                        <input type="text" class="subject" value="<%=item.BillingName %>" name="BillingName" />
                    </div>
                </div>
                <div class="fieldwrapper">
                    <label class="styled">Hộp thư <span style="color: red">(*)</span></label>
                    <div class="thefield">
                        <input type="text" class="subject" value="<%=item.BillingEmail %>" name="BillingEmail" />
                    </div>
                </div>
                
                <div class="fieldwrapper">
                    <label class="styled">Địa chỉ <span style="color: red">(*)</span></label>
                    <div class="thefield">
                        <input type="text" class="subject" value="<%=item.BillingAddress %>" name="BillingAddress" />
                    </div>
                </div>

                <div class="fieldwrapper">
                    <label class="styled">Điện thoại <span style="color: red">(*)</span></label>
                    <div class="thefield">
                        <input type="text" class="subject" value="<%=item.BillingPhone %>" name="BillingPhone" />
                    </div>
                </div>
                <div class="fieldwrapper">
                    <label class="styled">Di động</label>
                    <div class="thefield">
                        <input type="text" class="subject" value="<%=item.BillingMobile %>" name="BillingMobile" />
                    </div>
                </div>
                <div class="fieldwrapper">
                    <label class="styled">Tiêu đề <span style="color: red">(*)</span></label>
                    <div class="thefield">
                        <input type="text" class="subject" value="<%=item.BillingTitle %>" name="BillingTitle" />
                    </div>
                </div>
                <div class="fieldwrapper">
                    <label class="styled">Nội dung</label>
                    <div class="thefield">
                        <textarea name="Content" rows="" cols=""><%=item.Content%></textarea>
                    </div>
                </div>
                <div class="send">
                    <input type="submit" value="Gửi đơn hàng" name="_vsw_action[AddPOST]" />
                    <input type="reset" value="Nhập lại" />
                </div>
            </div>
            <div class="contact_left border_lienhe fr">{RS:Web_Feedback}</div>
        </div>
    </div>
</form>