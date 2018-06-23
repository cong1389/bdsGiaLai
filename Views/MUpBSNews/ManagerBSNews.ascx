<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var model = ViewBag.Model as MUpBSNewsModel;
    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    var Alert = ViewBag.Alert as MUpBSNewsModel;


    if (Alert  != null )
    {%>
        <script type="text/javascript">
            alert(<%=Alert.ToString()%>);
</script>
    <%}
    
%>


<form name="bsnews_form" method="post">
    <div class="box-bds all">
        <div class="title all">
            <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
            <div class="dv-ct-tabs">
                <h2><a href="javascrip:voi(0);" class="a-title">Quản Lý Tin Đăng! </a></h2>
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
                        <th>Tổng Giá</th>
                        <th>Diện Tích</th>
                        <th>Ngày Đăng</th>
                        <th>Tin</th>
                        <th>Delete<br />Edit</th>
                    </tr>

                    <%for (int i = 0; listItem != null && i < listItem.Count; i++){ %>
                    <tr class="row<%= i%2 %>">
                        <td align="center">
                            <%= i + 1%>
                        </td>
                        <td style="width: 15%; text-align: center;">
                             <a href="<%=listItem[i].Code%>.html" > Xem :<%= listItem[i].Name%></a>
                           
                        </td>
                        <td style="width: 15%; text-align: center;">
                            <%= Utils.GetMedia(listItem[i].File, 40, 40)%>
                        </td>
                        <td style="width: 10%; text-align: center;">
                            <%= (listItem[i].getMenu().Name) %>
                        </td>

                        <td style="width: 10%; text-align: center;">
                            <%= (listItem[i].getStreet().Name) %><br />
                            <%= (listItem[i].getDistrict().Name) %><br />
                            <%= (listItem[i].getCity().Name) %>
                        </td>
                        <td style="width: 10%; text-align: center;">
                           <%=string.Format("{0:#,##0}",listItem[i].TotalPrice )%>VNĐ
                             <br /><%= listItem[i].getDVPrice().Name %>
                        </td>
                         <td style="width: 10%; text-align: center;">
                            <%= listItem[i].Square %>m2<br />
                              <%=string.Format("{0:#,##0}",listItem[i].Price )%>VNĐ
                        </td>
                        <td style="width: 10%; text-align: center;">
                            <%= string.Format("{0:dd-MM-yyyy HH:mm}", listItem[i].Created) %>
                        </td>
                        <td style="width: 6%; text-align: center;">
                           <%if (listItem[i].isVip != 2 && listItem[i].isVip != 3)
	{%>
		 <p>Tin thường</p>
	<%}
                             else
                             {
                                 if (listItem[i].isVip == 2)
                                 {%>
                             <p style="color:#d56464">Vip</p>
                                 <%}
                                 else
                                 {%>
                                      <p style="color:#ff0000">Siêu-Vip</p>
                                 <%}%>
                                 
                             <%}%>
                        </td>
                        <td style="width: 6%; text-align: center;">

                             <a href="<%=ViewPage.GetURL("quan-ly-tin-dang/DeleteBSNews")%>?id=<%= listItem[i].ID%>" onclick="return confirm('Bạn muốn xóa tin <%=listItem[i].Name.Replace("'", "") %>  ?');"><img src="/Content/img/icon_delete.png" alt="delete" /></a><br />
                             <a href="<%=ViewPage.GetURL("quan-ly-tin-dang")%>?id=<%= listItem[i].ID%>" title="Edit">Edit</a>
                        </td>
                    </tr>
                    <%} %>
                </table>
        </div>
    </div>

</form>


