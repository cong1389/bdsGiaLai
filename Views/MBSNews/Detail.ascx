<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModBSNewsEntity;
    var listOther = ViewBag.Other as List<ModBSNewsEntity>;
    var listFile = item.getFiles();

    var model = ViewBag.Model as MBSNewsModel ?? new MBSNewsModel();
%>

<script type="text/javascript">
    Number.prototype.formatMoney = function (c, d, t, x) {
        var n = this,
            c = isNaN(c = Math.abs(c)) ? 2 : c,
            d = d == undefined ? "." : d,
            t = t == undefined ? "," : t,
            s = n < 0 ? "-" : "",
            i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
            j = (j = i.length) > 3 ? j % 3 : 0;
        if (x == ".") {
            return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + d);
        } else {
            return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t);
        }
    };


</script>

<div class="box-bds">
    <div class="title">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="Javascript:void(0)" class="a-title">Chi Tiết Dự Án</a></h2>
        </div>
    </div>
    <div class="bds-body">
        <div class="detail_du-an fl">
            <h1><%=item.Name %> </h1>
            <div class="pd-left fl">
                <p class="image">
                    <a href="javascript:void(0)" class="aviewimages" title="<%=item.Name %>">

                        <%if (listFile != null && listFile.Count > 0)
                          {%>
                        <img id="img" src="<%=Utils.GetResizeFile(listFile[0].File, 2, 388, 0)%>" alt="<%=item.Name %>" title="<%=item.Name %>" class="viewimages" />
                        <% }
                          else
                          {%>
                        <img id="img" src="<%=Utils.GetResizeFile(item.File, 2, 388, 0)%>" alt="<%=item.Name %>" title="<%=item.Name %>" class="viewimages" />
                        <%} %>
                    </a>
                </p>
                <div class="img-gallery">
                    <%if (listFile != null)
                      { %>
                    <ul class="list_images">
                        <%for (int i = 0; listFile != null && i < listFile.Count; i++)
                          {%>
                        <li class="image-nav-item pager <%=(i == 0 ? "current" : "") %>" onclick="swap(<%=listFile[i].File%>)">
                            <a href="javascript:void(0)" onclick="$('.image > a > img').attr('src', '<%=Utils.GetResizeFile(listFile[i].File, 2, 388, 0)%>');" rel="nofollow">
                                <img src="<%=Utils.GetResizeFile(listFile[i].File, 2, 55, 55)%>" alt="<%=item.Name %>" width="55" height="55" />
                            </a>
                        </li>
                        <%} %>
                    </ul>
                    <%} %>
                    <!--                      <a href="javascript:void(0)" class="bx-prev" id="images-prev">prev</a>
                        <a href="javascript:void(0)" class="bx-next" id="images-next">next</a> -->
                </div>
            </div>

            <div class="pd-right fr">
                <p class="box-price">
                    Diện Tích: <%=item.Square %> <span>m²<span>
                        <br />
                        <span><%= item.PriceText%> </span>/<%= item.getDVPrice().Name %>
                </p>
                <ul class="thongtin_du-an fr">
               <%-- <%if (item.DVPriceID == 1864)
                      {%>
                    <li>
                        <label>Tổng tiền:</label><span class="red"><%=string.Format("{0:#,##0}", (item.Price * item.Square))%> - Tổng Diện Tích</span>
                    </li>
                    <%} %>--%>
                    <%if(WebLogin.IsLogin() == true && WebLogin.CurrentUser.ID == item.WebUserID){ %>
                    <li>
                        <label>Chỉnh sửa tin:</label>
                    <span class="red"><a href="<%=ViewPage.GetURL("quan-ly-tin-dang")%>?id=<%= item.ID%>" title="Edit">Sửa tin</a> |   <a href="<%=ViewPage.GetURL("quan-ly-tin-dang/DeleteBSNews")%>?id=<%= item.ID%>" onclick="return confirm('Bạn muốn xóa tin <%=item.Name.Replace("'", "") %>  ?');">Xóa tin</a></span>
                        </li>
                    <%} %>
                    <li>
                        <label>Mã tin:</label><span class="red">RV-MS00<%=item.ID %> </span></li>
                    <li>
                        <label>Lượt xem:</label><span class="red"><%=item.View %></span></li>
                    <li>
                        <label>Tỉnh/Thành:</label><span><%=item.getCity().Name %></span></li>
                    <% if (item.DistrictID > 0)
                       {%>
                    <li>
                        <label>Quận/Huyện:</label><span><%=item.getDistrict().Name %> </span></li>
                    <% }%>

                    <% if (item.DirectionsID > 0)
                       {%>
                    <li>
                        <label>Hướng:</label><span><%=item.getDirections().Name %></span></li>

                    <% }%>
                    <li>
                        <label>Chuyên mục BĐS:</label><span><%=item.getType().Name %></span></li>
                    <li>
                        <label>Danh mục BĐS:</label><span><%=item.getMenu().Name %></span></li>
                    <li>
                        <label>Ngày đăng:</label><span><%= string.Format("{0:dd/MM/yyyy}", item.Created) %></span></li>
                    <li>
                        <p>Thông tin liên hệ </p>
                    </li>
                    <li>
                        <label>Tên liên lạc:</label><span><%=item.FullName %></span></li>
                    <li>
                        <label>Địa chỉ:</label><span><%=item.Address %></span></li>
                    <li>
                        <label>Điện thoại:</label><span><%=item.MobiPhone %></span></li>
                    <li>
                        <label>Email:</label><span><%=item.Email %></span></li>
                </ul>
            </div>
            <div class="clearfix"></div>
            <div class="likeface">
                <div class="fb-like" data-href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>" data-width="200" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
                <div class="g-plusone" data-size="medium"></div>
            </div>
        </div>

        <div class="clearfix"></div>
        <div class="thongtin_chitiet clearfix">
            <a href="javascript:void(0)" id="tab-1" onclick="changeTab('1', 'div-', 'tab-', '3', '', 'selected'); return false;" rel="nofollow">Mô tả</a>
            <a href="javascript:void(0)" id="tab-2" onclick="changeTab('2', 'div-', 'tab-', '3', '', 'selected'); return false;" rel="nofollow">Bản đồ</a>
            <a href="javascript:void(0)" id="tab-3" onclick="changeTab('3', 'div-', 'tab-', '3', '', 'selected'); return false;" rel="nofollow">Gửi liên hệ</a>
        </div>
        <div id="div-1" class="chitiet_duan">
            <p>
                <%=Utils.GetHTMLForSeo(item.Content)%>
            </p>
            <div class="fb-comments" data-href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>" data-width="660" data-numposts="20" data-colorscheme="light"></div>
        </div>
        <div id="div-2" style="display: none" class="chitiet_duan">
            <%if (item.Maps != string.Empty || item.Maps != null)
              {%>
            <div class="Maps"><%=item.Maps %></div>
            <%}
              else
              {%>
                  - Tin Này Không Có Dữ Liệu Bản Đồ ! 
              <%}%>
        </div>
        <div id="div-3" style="display: none" class="chitiet_duan">
            <%if (item.Email != null || item.Email != string.Empty)
              { %>
            <form method="post" name="email_detail_form" action="{ActionForm}">
                <div class="dangnhap-content all">
                    <div class="dangnhap-content-left">
                        <div class="dangnhap-content-left-row">
                            Liên Hệ sẽ được gửi về hộp thư: <%=item.Email%>
                        </div>
                        <div class="dangnhap-content-left-row">
                            <input type="text" name="Emaillh" id="Emaillh" value="<%=model.Emaillh %>" placeholder="Nhập Email Liên Hệ!" />
                        </div>
                        <div class="dangnhap-content-left-row">
                            <input type="text" name="Namelh" id="Namelh" value="<%=model.Namelh %>" placeholder="Nhập Tên Liên Hệ!" />
                        </div>
                        <div class="dangnhap-content-left-row">
                            <textarea name="Contactlh" id="Contactlh" placeholder="Nhập Nội dung!"><%=model.Contactlh %></textarea>
                        </div>
                        <input type="submit" name="_vsw_action[AddPOST]" value="Gửi Liện hệ" />
                        <input type="reset" name="Reset" value="Nhập lại" />
                    </div>
                    <%if (!WebLogin.IsLogin())
                      {%>
                    <div class="dangnhap-content-right">
                        <p class="colorblue">Nếu bạn chưa có tài khoản tại Reo.com.vn</p>
                        <div class="dangnhap-content-right-nut">
                            <a href="<%=ViewPage.GetURL("dang-ky")%>">
                                <input type="button" class="button-login" value="Đăng ký">
                            </a>
                        </div>
                    </div>
                    <%}
                      else
                      {%>
                    {RS:LHTin}
                    <%} %>
                </div>
            </form>

            <%} %>
        </div>
        <div class="clearfix"></div>
        <script type="text/javascript">

            <%if (model.StateForm == 1)
              {%>
            changeTab('3', 'div-', 'tab-', '3', '', 'selected');
            <%}
              else
              {%>
            changeTab('1', 'div-', 'tab-', '3', '', 'selected');
            <%}%>
        </script>
    </div>
</div>
<%if (listOther != null)
  {%>
<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2 title="<%=ViewPage.CurrentPage.Name %>"><a href="<%=ViewPage.GetURL(item.Code)%> " class="a-title" title="<%=ViewPage.CurrentPage.Name %>">Tin Liên Quan: <%=  ViewPage.CurrentPage.PageTitle.Length > 45 ? ViewPage.CurrentPage.PageTitle.Substring(0,44)+" ..." : "" %> </a></h2>
            <p class="fr dangvip ico-sty">
                <a href="<%=ViewPage.GetURL(item.Code)%>" title="<%=ViewPage.CurrentPage.Name %>">Đăng V.I.P </a>
            </p>
        </div>
    </div>
    <div class="bds-body">
        <div class="list-bds">
            <ul>
                <%for (int i = 0; listOther != null && i < listOther.Count; i++)
                  {
                      string url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);

                      string hover = string.Empty;
                      string title = string.Empty;
                      title = listOther[i].Name.ToString();
                      string content = Data.RemoveAllTag(listOther[i].Content);
                      if (!string.IsNullOrEmpty(content)) hover = Data.CutString(content, 150);
                      else if (!string.IsNullOrEmpty(listOther[i].Summary)) hover = Data.CutString(listOther[i].Summary, 150);
                %>
                <li>
                    <a href="<%=url %>" class="avatar">
                        <img src="<%= Utils.GetResizeFile(listOther[i].File, 2, 260, 180)%>" title="<%=title %>" alt="<%=title %>"></a>
                    <div class="wr_info">

                        <h3 class="<%= listOther[i].State == 1 ? "titlehot" : "title" %>" title="<%=title %>">
                            <a href="<%=url %>" title="<%=title %>" class="screenshot" rel="<%= Utils.GetResizeFile(listOther[i].File, 2, 260, 180)%>" rev="<%= hover %>"><%= listOther[i].Name %>
                                <%if (listOther[i].State == 1)
                                  {%>
                                <img border="0" src="/Content/skins/images/imgVip.gif" alt="<%=title %>" title="<%=title %>">
                                <%} %>
                               
                            </a>
                        </h3>
                        <div class="meta">
                            <div class="mt1">
                                <label>Mức giá</label>
                                <label>Diện tích</label>
                                <label>Địa điểm</label>
                            </div>
                            <div class="mt2">
                     <div class="price">: <%--<%=listOther[i].DVPriceID != 0 ? string.Format("{0:#,##0}", listOther[i].Price) : "Thỏa Thuận" %> <%=listOther[i].DVPriceID != 0 ? listOther[i].getDVPrice().Name : ""%>--%><%=listOther[i].PriceText %></div>
                                <div class="area">: <%= listOther[i].Square %> m² </div>
                                <div class="address">: <%=listOther[i].getStreet().Name %> <%= listOther[i].StreetID > 0 ? "-" : ""%> <%=listOther[i].getDistrict().Name %> <%= listOther[i].DistrictID > 0 ? "-" : ""%> <%=listOther[i].getCity().Name %> </div>
                            </div>
                        </div>
                        <p class="wr_view time"><%= string.Format("{0:dd/MM/yyyy}", listOther[i].Created) %> </p>
                    </div>
                </li>
                <%} %>
            </ul>
        </div>
    </div>
</div>
<%} %>

<script type="text/javascript">
                    <%if (item.Price > 0)
                      {%>


    var html_value = addCommas(<%=item.Price%>) + ' VNĐ';
    $('#PriceOut').html(html_value);
    function addCommas(nStr) {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }
     <%}
                      else
                      {%>
    var html_value = ' Thỏa Thuận ';
    $('#PriceOut').html(html_value);
    <%}%>

</script>
