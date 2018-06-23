<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var model = ViewBag.Model as ModProductModel;
    var listItem = ViewBag.Data as List<ModProductEntity>;
    var Alert = ViewBag.Alert as ModProductModel;


    if (Alert  != null )
    {%>
        <script type="text/javascript">
            alert(<%=Alert.ToString()%>);
</script>
    <%}
%>

<form name="bsnews_form" id="bsnews_form" method="post">
    <div class="box-bds all">
        <div class="title all">
            <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
            <div class="dv-ct-tabs">
                <h2><a href="javascrip:voi(0);" class="a-titledetail">Quản Lý Sản Phẩm! </a></h2>
            </div>
        </div>
        <div class="bds-body">
                <table border="1" cellspacing="0" style="width: 100%; border: 1px solid #ccc; border-collapse: collapse;" rules="all">
                    <tr class="roll_01">
                        <th>STT</th>
                        <th>Tiêu Đề</th>
                        <th>Img</th>
                        <th>Danh Mục</th>
                        <th>City</th>
                        <th>Giá</th>
                        <th>Ngày Đăng</th>
                        <th>ID</th>
                        <th>Delete</th>
                    </tr>

                    <%for (int i = 0; listItem != null && i < listItem.Count; i++){ %>
                    <tr class="row<%= i%2 %>">
                        <td align="center">
                            <%= i + 1%>
                        </td>
                        <td style="width: 15%; text-align: center;">
                            <a href="<%=listItem[i].Code %>.html">Xem-<%= listItem[i].Name%></a>
                        </td>
                        <td style="width: 15%; text-align: center;">
                            <%= Utils.GetMedia(listItem[i].File, 40, 40)%>
                        </td>
                        <td style="width: 10%; text-align: center;">
                            <%= (listItem[i].getMenu().Name) %>
                        </td>

                        <td style="width: 10%; text-align: center;">
                            <%= (listItem[i].getCity().Name) %>
                        </td>
                        <td style="width: 10%; text-align: center;">
                            <%= listItem[i].Price %>
                        </td>
                        <td style="width: 10%; text-align: center;">
                            <%= string.Format("{0:dd-MM-yyyy HH:mm}", listItem[i].Published) %>
                        </td>
                        <td style="width: 6%; text-align: center;">
                            <a href="<%=ViewPage.GetURL("quan-ly-san-pham")%>?id=<%= listItem[i].ID%>">Sửa Mã - <%= listItem[i].ID%></a>
                        </td>
                        <td style="width: 6%; text-align: center;">
                             <a href="<%=ViewPage.GetURL("quan-ly-san-pham/DeleteProduct")%>?id=<%= listItem[i].ID%>" onclick="return confirm('Bạn muốn xóa tin <%=listItem[i].Name.Replace("thong bao", "") %>  ?');">delete</a>
                        </td>
                    </tr>
                    <%} %>
                </table>
        </div>
    </div>

</form>


