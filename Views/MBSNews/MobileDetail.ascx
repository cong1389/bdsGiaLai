<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModBSNewsEntity;
    var listOther = ViewBag.Other as List<ModBSNewsEntity>;
    //var listFile = item.getFiles();

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

<div class="box_detail_bds all">
    <h1 class="pName"><%=item.Name %></h1>
    <div class="pd-image">
        <img src="<%=Utils.GetResizeFile(item.File, 4, 0, 340)%>" alt="<%=item.Name %>" />
    </div>
    <p class="box-price">
        Diện Tích: <%=item.Square %> <span>m²</span>
            <br />
            <span id="PriceOut"></span><%= item.DVPriceID > 0 ? "-" : ""%> <%= item.getDVPrice().Name %>
    </p>
    <ul class="list_parameter all">
        <%if (item.DVPriceID == 1864)
          {%>
        <li>
            <label>Tổng tiền:</label><span class="red"><%=string.Format("{0:#,##0}", (item.Price * item.Square))%> - Tổng Diện Tích</span>
        </li>
        <%} %>
        <li>
            <label>Mã tin:</label>
            <span>RV-ND<%=item.ID %></span> </li>
        <li>
            <label>Lượt xem:</label><span><%=item.View %></span>
            <div class="fb-like" data-href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>" data-width="150" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
            <div class="g-plusone" data-size="medium"></div>
        </li>
        <%if (item.CityID > 0)
          {%>
        <li>
            <label>Tỉnh/Thành:</label><span><%=item.getCity().Name%></span></li>
        <%} %>
        <%if (item.DistrictID > 0)
          {%>
        <li>
            <label>Quận/Huyện:</label><span><%=item.getDistrict().Name%> </span></li>
        <%} %>
        <%if (item.DirectionsID > 0)
          {%>
        <li>
            <label>Hướng:</label><span><%=item.getDirections().Name%></span></li>
        <%} %>
        <li>
            <label>Chuyên mục BĐS:</label><span><%=item.getType().Name%></span></li>
        <li>
            <label>Danh mục BĐS:</label><span><%=item.getMenu().Name%></span></li>
        <li>
            <label>Ngày đăng:</label><span><%=item.Time %></span></li>
        <li>
            <p>Thông tin liên hệ </p>
        </li>
        <li>
            <label>Tên liên lạc:</label><span><%=item.FullName %></span></li>
        <%if (item.Address != null)
          {%>
        <li>
            <label>Địa chỉ:</label><span><%=item.Address %></span></li>
        <%} %>
        <li>
            <label>Điện thoại:</label><span><%=item.MobiPhone != null ? item.MobiPhone:item.Phone %></span></li>
        <%if (item.Email != null)
          {%>
        <li>
            <label>Email:</label><span><%=item.Email != null ? item.Email:"" %></span></li>
        <%}%>
    </ul>
    <div class="clear"></div>
    <div class="info-content">
        <div class="top-link-detail">
            <a href="javascript:void(0)" id="tab-1" onclick="changeTab('1', 'div-', 'tab-', '2', '', 'current'); return false;" rel="nofollow">Chi Tiết</a>
            <a href="javascript:void(0)" id="tab-2" onclick="changeTab('2', 'div-', 'tab-', '2', '', 'current'); return false;" rel="nofollow">Gửi Liên Hệ</a>
        </div>
        <div class="content-ct" id="div-1">
                <%=Utils.GetHTMLForSeo(item.Content)%>
            <div class="fb-comments" data-href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>" data-width="200" data-numposts="5" data-colorscheme="light"></div>
        </div>
        <div class="content-ct" style="display: none" id="div-2">
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
                </div>
            </form>

            <%} %>
        </div>
    </div>
</div>

<script type="text/javascript">
    changeTab('1', 'div-', 'tab-', '2', '', 'current');
</script>
<div class="box-bds all">
        			<div class="title01 all"> <h2><a href="Javascript:void(0)">Thông tin khác</a></h2> </div> 
    				<ul class="list-bds">
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
    						<h3> <a href="<%=url %>"><%=listOther[i].Name %></a>
	                        </h3>
	                        <div class="img_bds"><a href="<%=url %>"><img src="<%= Utils.GetResizeFile(listOther[i].File, 2, 185, 105)%>" alt="<%=listOther[i].Name %>"></a> </div>
	                        <p><a href="<%=url %>">
								<%=hover %>
							</a></p>
							<div class="meta">
								<span class="sp-info"> <b>Giá:</b><%=string.Format("{0:#,##0}", listOther[i].Price)%>  </span>
								<span class="sp-info"> <b>Giá:</b> <%=listOther[i].Square %> m2 </span>
								<span class="sp-info"> <b>Địa điểm :</b> <%=listOther[i].getCity().Name %> </span>
							</div>
	                        <span class="time"><%=listOther[i].Time %></span>
	                    </li>
                             <%} %>
    				</ul>
        			<div class="clear"></div>
        		</div>

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
