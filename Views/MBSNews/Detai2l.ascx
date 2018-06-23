<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModBSNewsEntity;
    var listOther = ViewBag.Other as List<ModBSNewsEntity>;
    var listFile = item.getFiles();
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
            <h2><a href="" class="a-title">Chi Tiết Dự Án</a></h2>
        </div>
    </div>
    <div class="bds-body">
        <div class="detail_du-an fl">
            <h3><%=item.Name %> </h3>
            <div class="pd-left fl">
                <p class="image">
                    <a href="#">
                        <img title="<%=item.Name %>" alt="<%=item.Name %>" src="<%= Utils.GetResizeFile(item.File, 2, 365, 265)%>"></a>
                </p>
                <div class="img-gallery">
                    <%if (listFile != null)
                      { %>
                    <ul class="list_images fl">
                        <%for (int i = 0; listFile != null && i < listFile.Count; i++)
                          {%>
                        <li><a href="Javascript:void(0)"><img title="<%=item.Name %>" alt="<%=item.Name %>" src="<%= Utils.GetResizeFile(listFile[i].File, 2, 67, 67)%>"></li>
                        <%} %>
                    </ul>
                    <a href="" class="bx-prev">prev</a>
                    <a href="" class="bx-next">next</a>
                    <%} %>
                </div>
            </div>
            <div class="pd-right fr">
                <p class="box-price">
                    <%=item.PriceText%>
                    <br />
                    Diện Tích:<%=item.Square %>
                </p>
                <ul class="thongtin_du-an fr">
                    <li>
                        <label>Mã tin:</label><span class="red"><%=item.ID %></span></li>
                    <li>
                        <label>Lượt xem:</label><span class="red"><%=item.View %></span></li>
                    <li>
                        <label>Tỉnh/Thành:</label><span><%=item.getCity().Name %></span></li>
                    <li>
                    <li>
                        <label>Quận/Huyện:</label><span><%=item.getDistrict().Name %> </span></li>
                    <li>
                    <li>
                        <label>Phường/Xã:</label><span><%=item.getStreet().Name %> </span></li>
                    <li>
                        <label>Dự Án:</label><span>
                            <%=item.getProject().Name %></span></li>
                    <li>
                        <label>Hướng:</label><span><%=item.getDirections().Name %></span></li>
                    <li>
                        <label>Loại hình BĐS:</label><span><%=item.getType().Name %> - <%=item.getMenu().Name %></span></li>
                    <li>
                        <label>Ngày đăng:</label><span><%= string.Format("{0:dd/MM/yyyy}", item.Created) %></span></li>
                    <li>
                    <li>
                        <label>Ngày hết hạn:</label><span><%= string.Format("{0:dd/MM/yyyy}", item.DateEnd) %></span></li>

                    <li>
                        <p>Thông tin liên hệ </p>
                    </li>
                    <li>
                        <label>Tên liên lạc:</label><span><%=item.FullName %></span></li>
                    <li>
                        <label>Home Phone:</label><span><%=item.Phone %></span></li>
                    <li>
                        <label>Mobi Phone:</label><span><%=item.MobiPhone %></span></li>
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
                <%=Utils.GetHTMLForSeo(item.Content) %>
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
              <%} %>
        </div>
        <div id="div-3" style="display: none" class="chitiet_duan">
            <%if (item.Email != null || item.Email != string.Empty)
              { %>
            <form method="post" name="login_form" action="{ActionForm}">
                <div class="dangnhap-content all">
                    <div class="dangnhap-content-left">
                        <div class="dangnhap-content-left-row">
                            Liên Hệ sẽ được gửi về hộp thư: <%=item.Email%>
                        </div>
                        <div class="dangnhap-content-left-row">
                            <input type="text" name="Emaillh" id="Emaillh" value="" placeholder="Nhập Email Liên Hệ!" />
                        </div>
                        <div class="dangnhap-content-left-row">
                            <input type="text" name="Namelh" id="Namelh" value="" placeholder="Nhập Tên Liên Hệ!" />
                        </div>
                        <div class="dangnhap-content-left-row">
                            <textarea name="Contactlh" id="Contactlh" placeholder="Nhập Nội dung!"></textarea>
                        </div>
                        <input type="submit" name="_vsw_action[EmailPOST]" value="Gửi Liện hệ" />
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
            <%} else{%>
                    {RS:LHTin}
                    <%} %>
                </div>
            </form>
            
        <%} %>
        </div>
        <div class="clearfix"></div>
        <script type="text/ecmascript">
            changeTab('1', 'div-', 'tab-', '3', '', 'selected');
        </script>
    </div>
</div>
<%if (listOther != null)
  {%>
<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="" class="a-title">Tin Liên Quan</a></h2>
            <p class="fr dangvip ico-sty">
                <a href="">Đăng V.I.P <%--<%=count %>--%></a>
            </p>
        </div>
    </div>
    <div class="bds-body">
        <div class="table all">
            <div class="bl_desc all">
                <ul>
                    <li class="tieude">Tiêu đề tin</li>
                    <li class="khuvuc">Khu vực</li>
                    <li class="date">Ngày đăng</li>
                </ul>
            </div>
            <div class="bl_result all">
                <ul>
                    <%for (int i = 0; i < listOther.Count; i++)
                      {
                          string url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);
                    %>

                    <li <%if (listOther[i].State == 1)
                          {%>
                        class="tinhot" <%} %>>
                        <span class="tieude">
                            <a <%if (listOther[i].State == 1)
                                 {%>style="color:red"
                                <%} %> href="<%=url %>" title="<%= listOther[i].Name %>" class="screenshot" rel="<%= Utils.GetResizeFile(listOther[i].File, 2, 260, 180)%>" rev="<%= listOther[i].Summary %>">
                                <h4><%= listOther[i].Name %>
                                    <%if (listOther[i].State == 1)
                                      {%>
                                    <img border="0" src="/Content/skins/images/imgVip.gif">
                                    <%} %>
                                </h4>
                            </a>
                        </span>
                        <span class="khuvuc" title="<%=listOther[i].getDistrict().Name %> - <%=listOther[i].getCity().Name %>"><%=listOther[i].getDistrict().Name %> - <%=listOther[i].getCity().Name %></span>
                        <span class="date"><%= string.Format("{0:dd/MM/yyyy}", listOther[i].Created) %></span>
                    </li>
                    <%} %>
                </ul>
            </div>
        </div>
    </div>
</div>
<%} %>
