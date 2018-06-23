<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var model = ViewBag.Model as MObjectSaveModel ?? new MObjectSaveModel();
    var cart = new Cart("ObjectSave");
%>

<form method="post" name="save_form">
    <div class="tintuc_mts fl">
        <h3><a href="javascript:void(0);" rel="nofollow"><%=ViewPage.CurrentPage.Name %></a></h3>
        <div class="box_big_md">
            <div class="bang">
                <table style="border-color: #ccc; border-width: 1px; border-style: solid; width: 100%; border-collapse: collapse;" border="1" cellspacing="0">
                    <tr class="roll_01">
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Xóa</th>
                    </tr>

                    <%
                        for (int i = 0; i < cart.Items.Count; i++){
                            var product = ModProductService.Instance.GetByID(cart.Items[i].ProductID);
                            if (product == null) continue;

                            string url = ViewPage.GetURL(product.MenuID, product.Code);
                    %>
                    <tr class="roll_01">
                        <td style="width: 10%; text-align: center;">
                            <a href="<%=url %>"><img src="<%=Utils.GetResizeFile(product.File, 2, 55, 0) %>" alt="<%=product.Name %>" border="0" align="absmiddle" /></a>
                        </td>
                        <td style="width: 30%; text-align: left;"><a href="<%=url %>"><%=product.Name %></a></td>
                        <td style="width: 15%; text-align: center;"><%=string.Format("{0:#,##0}", product.Price)%> Đ</td>
                        <td style="width: 5%; text-align: center;">
                            <a href="javascript:void(0);" onclick="confirmZebra('Bạn muốn xóa sản phẩm <%=product.Name %> khỏi mục lưu ?','<%=ViewPage.GetURL("san-pham-da-luu/Delete")%>/Index/<%=i %>?returnpath=<%=model.returnpath %>');"><img align="absmiddle" alt="Xóa" title="Xóa" src="/Content/skins/images/delete.gif" /></a>
                        </td>
                    </tr>
                    <%} %>

                </table>
            </div>
            <div align="right">
                <p class="clear_10"></p>

                <div align="right" class="cart_button">
                    <%if (ViewPage.PageViewState.Exists("returnpath")){%>
                    <a href="<%=model.returnpath %>">Quay lại</a>
                    <%} %>
                    <a href="javascript:void(0);" onclick="window.print(); return false;">In danh sách sản phẩm đã lưu</a>
                </div>
                <p class="clear_5"></p>
            </div>
            <div class=" clear"></div>
        </div>
    </div>
</form>