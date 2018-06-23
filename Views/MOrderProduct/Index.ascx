<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var model = ViewBag.Model as ModOrderProductModel;
    var listItem = ViewBag.Data as List<ModOrderEntity>;
    var Alert = ViewBag.Alert as ModOrderProductModel;
    
    if (Alert  != null )
    {%>
        <script type="text/javascript">
            alert(<%=Alert.ToString()%>);
</script>
    <%}
%>
<div>
<form id="order_form" name="order_form" method="post">
                <h2><a href="javascrip:voi(0);" class="a-titledetail">Quản Lý Dơn Hàng! </a></h2>
                <table >
                <tr>
                    <th>
                        STT
                    </th>
                    <th >
                        Mã đơn hàng
                    </th>
                    <th>
                       Cửa hàng
                    </th>
                    <th>
                        Tổng tiền
                    </th>
                    <th>
                       Số Lượng
                    </th>
                    <th>
                        Ngày tạo
                    </th>
                </tr>
               <%for (int i = 0; listItem != null && i < listItem.Count; i++)
                 {
                     var product = ModProductService.Instance.GetByID(listItem[i].ProductID);
                 %>
                <tr>
                    <td>
                        <%= i + 1%>
                    </td>
                    <td>
                       <a href="<%=ViewPage.GetURL("quan-ly-don-hang/DetailOrder")%>?id=<%= listItem[i].ID %>"><%= listItem[i].Code%></a>
                         <%--<a href="javascript:VSWRedirect('DetailOrder', <%= listItem[i].ID %>)"><%= listItem[i].Code%></a>--%>
                    </td>
                    <td>
                       <%= listItem[i].getWebUser().Shop%>
                    </td>
                    <td>
                        <%if (product!=null) {%><%= string.Format("{0:#,0##}", product.Price * listItem[i].Quantity)%><%}else {%>Sản Phẩm Ngừng Bán<% }%>
                    </td>
                    <td>
                        <%= listItem[i].Quantity%>
                    </td>
                    <td>
                       <%= string.Format("{0:dd/MM/yyyy HH:mm}", listItem[i].Created) %>
                    </td>
                    <td>
                      <a href="<%=ViewPage.GetURL("quan-ly-don-hang/DeleteOrder")%>?id=<%= listItem[i].ID%>" onclick="return confirm('Bạn muốn xóa tin <%=listItem[i].Name%>  ?');">delete</a>
                    </td>
                </tr>
                <%} %>
        </table>
</form>

</div>