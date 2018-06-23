<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<% 
    var user = WebLogin.CurrentUser;

    var item = ViewBag.Data as ModBSNewsEntity ?? new ModBSNewsEntity();
    var model = ViewBag.Model as MUpBSNewsModel ?? new MUpBSNewsModel();

    var DateDefaul = WebSettingService.Instance.GetByCode_Cache("DateAllDefaul"); //ngày mặc định of datepick
    int DateAllDefaul = DateDefaul != null ? VSW.Core.Global.Convert.ToInt(DateDefaul.Value) : 30;


    var DateMax = WebSettingService.Instance.GetByCode_Cache("DateAllMax"); // ngày max of datepick
    string DateAllMax = DateMax != null ? DateMax.Value : "+12M +0D";

    var listmenu = SysPageService.Instance.GetByParent_Cache(477);
    var listFile = item.getFiles();
    var s = string.Empty;
    var arrfile = string.Empty;
    if (listFile != null)
    {
        for (int i = 0; listFile != null && i < listFile.Count; i++)
        {
            if (i != 0)
            {
                arrfile += "|";
            }
            arrfile += listFile[i].File;
        }
    }
    
%>
<script type="text/javascript">
    $(document).ready(function () {
        $(":file").filestyle();
        $.datepicker.regional["vi-VN"] =
          {
              closeText: "Đóng",
              prevText: "Trước",
              nextText: "Sau",
              currentText: "Hôm nay",
              monthNames: ["Tháng một", "Tháng hai", "Tháng ba", "Tháng tư", "Tháng năm", "Tháng sáu", "Tháng bảy", "Tháng tám", "Tháng chín", "Tháng mười", "Tháng mười một", "Tháng mười hai"],
              monthNamesShort: ["Một", "Hai", "Ba", "Bốn", "Năm", "Sáu", "Bảy", "Tám", "Chín", "Mười", "Mười một", "Mười hai"],
              dayNames: ["Chủ nhật", "Thứ hai", "Thứ ba", "Thứ tư", "Thứ năm", "Thứ sáu", "Thứ bảy"],
              dayNamesShort: ["CN", "Hai", "Ba", "Tư", "Năm", "Sáu", "Bảy"],
              dayNamesMin: ["CN", "T2", "T3", "T4", "T5", "T6", "T7"],
              weekHeader: "Tuần",
              dateFormat: "dd/mm/yy",
              firstDay: 1,
              isRTL: false,
              showMonthAfterYear: false,
              yearSuffix: ""
          };
        $.datepicker.setDefaults($.datepicker.regional["vi-VN"]);
    });
    function check() {
        if (document.getElementById("TypeID").value > 0 && document.getElementById("MenuID").value > 0) {
            document.getElementById("text1").innerHTML = "<%=item.getType().Name %> ";
            document.getElementById("text2").innerHTML = " - <%=item.getMenu().Name %>";
            $('.all_info_item_new').css("display", "block");
            $('.step_2').css("display", "none");
            $('.choose_menu').css("display", "none");
        }
    }
</script>

<script runat="server">
    List<WebMenuEntity> listCity = null;
    int CityID = -1, DistrictID = -1, StreetID = -1, ProjectID = -1;
    string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        listCity = GetByType("City");

        var item = ViewPage.ViewBag.Data as ModBSNewsEntity;
        if (item != null)
        {
            CityID = item.CityID;
            DistrictID = item.DistrictID;
            StreetID = item.StreetID;
            ProjectID = item.ProjectID;

        }
        else
        {
            VSW.Core.Web.VQS qs = ViewPage.CurrentVQS;
            for (int i = 0; i < qs.Count - 1; i++)
            {
                string indexVSQ = qs.GetString(i).ToLower();
                int value = VSW.Core.Global.Convert.ToInt((indexVSQ.Substring(1)));
                if (indexVSQ.IndexOf('c') > -1) CityID = value;
                else if (indexVSQ.IndexOf('d') > -1) DistrictID = value;
                else if (indexVSQ.IndexOf('s') > -1) StreetID = value;
            }
        }

        title = ViewBag.Title;
    }

    private List<WebMenuEntity> GetByType(string type)
    {
        var list = WebMenuService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Type == type && o.ParentID == 0)
                            .ToList_Cache();

        if (list == null) return null;

        return WebMenuService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.Type == type && o.ParentID == list[0].ID)
                    .OrderByAsc(o => new { o.Order, o.ID })
                    .ToList_Cache();
    }

</script>
<script>
    $(function () {
        $("#datepicker").datepicker({
            minDate: +5,
            maxDate: '<%=DateAllMax%>',
            dateFormat: 'dd/mm/yy',
            altField: '#DateEnd',
            defaultDate: +<%=DateAllDefaul%>,
            onSelect: function (dateText, inst) {
                var firstday = new Date($("#DateStart").val().split("/").reverse().join(","));
                var lastday = new Date($("#datepicker").val().split("/").reverse().join(","));
                var days = (lastday - firstday) / 86400000;
                ChangeDate(dateText, days);
            }
        });
    })
</script>

<form name="feedback_form" method="post" enctype="multipart/form-data" id="feedback_form">
    <div class="all_info_item_new">
        <p class="step_3">Nhập thông tin</p>
        <div class="general_info_new">
            <div class="area_info_cat">
                <b class="fl">Chuyên mục bạn đã chọn</b>
                <div class="bg-text1 fl" id="settext"><span id="text1"><<<<< Chọn Chuyên Mục</span><span id="text2"></span></div>
                <input type="hidden" name="TypeID" id="TypeID" value="<%=item.TypeID %>">
                <input type="hidden" name="MenuID" id="MenuID" value="<%=item.MenuID %>">
                <input type="hidden" name="DVPriceCheck" id="DVPrice" value="<%=item.DVPriceID %>">
                <input type="hidden" name="DateEnd" id="DateEnd" value="<%= string.Format("{0:dd/MM/yyyy}", DateTime.Now.AddDays(DateAllDefaul)) %>">
                <ul class="dangky dangtin fl">
                    <li>
                        <label class="fl w150px">&nbsp;</label>
                        <div class="ddlgr">
                            <select class="ddl w150px" name="DDLTypeID" id="DDLTypeID" onchange="ChangeType(this.value); return false;">
                                <option value="0">- Chọn Chuyên mục -</option>
                                <%for (int i = 1; listmenu != null && i < listmenu.Count - 3; i++)
                                  {
                                      var listChildItem = SysPageService.Instance.GetByParent_Cache(listmenu[i].ID);
                                %><option <%=item.TypeID == listmenu[i].MenuID ? "style=\"background:#000;color:#fff\"" : "" %> data-dvprice="<%=listmenu[i].DVPriceID%>" data-name="<%=listmenu[i].Name%>" data-menuid="<%=listmenu[i].MenuID%>" value="<%=listmenu[i].ID%>|<%=listmenu[i].MenuID%>|<%=listmenu[i].DVPriceID%>|<%=listmenu[i].Name%>|" <%=item.TypeID == listmenu[i].MenuID ? "selected" :"" %>><%=listmenu[i].Name %></option>

                                <%} %>
                            </select>
                        </div>
                        <div class="ddlgr">
                            <select class="ddl w150px" name="DDLMenuID" id="DDLMenuID" onchange="ChangeMenu(this.value); return false;">
                                <option value="0">- Chọn Danh mục -</option>
                            </select>
                        </div>
                    </li>
                    <li>
                        <label class="fl w150px">Loại Tin</label>
                        <div class="ddlgr">
                            <select class="ddl w150px" name="isVip" id="isVip" onchange="ChangeisVip(); return false;">
                                <option value="1" <%=item.isVip == 1 ? "selected" :""%><%=item == null ? "selected" :""%>>- Tin Thường -</option>
                                <option value="2" <%=item.isVip == 2 ? "selected" :""%>>- Tin Vip (1 sao) -</option>
                                <option value="3" <%=item.isVip == 3 ? "selected" :""%>>- Tin Cực Vip (2 sao) -</option>
                            </select>
                        </div>
                        <p id="datepickertxt2" class="fl "><a href="<%=ViewPage.GetURL("huong-dang-dang-tin-vip-va-sieu-vip") %>" title="Hướng đẫn đăng tin Vip - Siêu Vip">Hướng đẫn đăng tin Vip - Siêu Vip</a></p>

                    </li>
                </ul>
            </div>
            <ul class="dangky dangtin fl">

                <li>
                    <label class="fl">Thời gian đăng</label>
                    <input name="DateStart" type="text" id="DateStart" class="w150px fl" style="cursor: pointer;" readonly="true" value="<%= string.Format("{0:dd/MM/yyyy}", DateTime.Now) %>">
                    <input name="datepicker" type="text" readonly="true" style="cursor: pointer; margin-left: 10px" class="w150px fl" id="datepicker" value="<%= string.Format("{0:dd/MM/yyyy}", DateTime.Now.AddDays(DateAllDefaul)) %>">
                </li>
                <li>
                    <label>Tiêu đề:<span class="red">*</span></label>
                    <input type="text" value="<%=item.Name %>" name="Name">
                </li>

                <li class="fieldwrapper">
                    <label>Nội dung đăng <span class="red">*</span> </label>
                    <textarea class="ckeditor" name="Content" id="Content" rows="5" cols="5"><%=item.Content%></textarea>
                </li>
                <li>
                    <label>Diện tích</label>
                    <input type="text" onkeypress='return validateQty(event)' onkeyup="GetPrice()" onchange="GetPrice()" class="w150px" autocomplete="off" value="<%=item.Square %>" name="Square" id="Square" />
                    <span class="red" id="SquareOut"></span>
                </li>
                <li>
                    <label class="fl">Giá tiền</label>
                    <input id="Price" onkeypress='return validateQty(event)' onkeyup="GetPrice()" onchange="GetPrice()" type="text" autocomplete="off" placeholder="" class="w150px fl" value="<%=item.Price %>" name="Price" />
                    <div class="ddlgr">
                        <select class="ddl" id="DVPriceID" name="DVPriceID" onchange="GetPrice()">
                            <option value="0">- Thỏa thuận -</option>
                            <%if (item.DVPriceID != null)
                              {%>

                            <%if (item.DVPriceID == 1)
                              {%><%=Utils.ShowDDLMenuByType2("DVPrice2", ViewPage.CurrentLang.ID, item.DVPriceID) %> <%} %>
                            <%else if (item.DVPriceID == -1)
                              {%><%=Utils.ShowDDLMenuByType2("DVPrice", ViewPage.CurrentLang.ID, item.DVPriceID) %> <%} %>
                            <%else
                              {%><%=Utils.ShowDDLMenuByType2("DVPrice", ViewPage.CurrentLang.ID, item.DVPriceID) %><%=Utils.ShowDDLMenuByType2("DVPrice2", ViewPage.CurrentLang.ID, item.DVPriceID) %> <%} %>

                            <%} %>
                        </select>
                    </div>
                </li>
                <li>
                    <label>Thành Tiền</label>
                    <span class="red" id="display_price"><%=item.TotalPrice %></span>
                    <input type="hidden" value="" id="TotalPrice" name="TotalPrice" />

                    <script type="text/javascript">
                        function validateQty(event) {
                            var key = window.event ? event.keyCode : event.which;

                            if (event.keyCode == 8 || event.keyCode == 46
                             || event.keyCode == 37 || event.keyCode == 39) {
                                return true;
                            }
                            else if (key < 48 || key > 57) {
                                return false;
                            }
                            else return true;
                        };

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

                        $.fn.digits = function () {
                            return this.each(function () {
                                $(this).text($(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                            })
                        }

                        function GetPrice() {
                            var value = $('#Price').val();

                            if ($('#DVPriceID').val() == 1864) {
                                value = $('#Price').val() * $('#Square').val();
                                document.getElementById("Price").readOnly = false;

                                $('#TotalPrice').val(value);
                                //var html_value = value.digits() + ' ' + $('#DVPriceID option:selected').text();
                                var html_value = addCommas(value) + ' - ' + $('#DVPriceID option:selected').text();
                                $('#display_price').html(html_value);
                            }
                            else if ($('#DVPriceID').val() == 0) {
                                document.getElementById("Price").readOnly = true;

                                $('#TotalPrice').val(value);
                                //var html_value = value.digits() + ' ' + $('#DVPriceID option:selected').text();
                                var html_value = addCommas(value) + ' - ' + $('#DVPriceID option:selected').text();
                                $('#display_price').html(html_value);
                            }
                            else {
                                document.getElementById("Price").readOnly = false;

                                $('#TotalPrice').val(value);
                                //var html_value = value.digits() + ' ' + $('#DVPriceID option:selected').text();
                                var html_value = addCommas(value) + ' - ' + $('#DVPriceID option:selected').text();
                                $('#display_price').html(html_value);
                            }


                        }
                    </script>
                </li>
                <li>
                    <label class="fl">Giá tiền bằng chữ</label>
                    <input id="PriceText" type="text"  placeholder="1 tỷ 1      (Không bắt buộc !)"  value="<%=item.PriceText %>" name="PriceText" />
                </li>
                <li class="viewImg">
                    <div class="uploadImg">
                        <%if (model.id <= 0)
                          {%>
                        <label class="fl">Ảnh 1</label>
                        <input class="filestyle" data-placeholder="Chưa có ảnh !" data-classbutton="btn btn-primary" data-classicon="icon-plus" data-buttontext="Chọn ảnh đăng" onchange="showimagepreview(this);return false;" id="File" type="file" name="File" value="<%=listFile.Count > 0 ? listFile[0].File: "" %>"><br />
                        <label class="fl">Ảnh 2</label>
                        <input class="filestyle" data-placeholder="Chưa có ảnh !" data-classbutton="btn btn-primary" data-classicon="icon-plus" data-buttontext="Chọn ảnh đăng" onchange="showimagepreview(this);return false;" id="File1" type="file" name="File1" value="<%=listFile.Count > 1 ? listFile[1].File: "" %>"><br />
                        <label class="fl">Ảnh 3</label>
                        <input class="filestyle" data-placeholder="Chưa có ảnh !" data-classbutton="btn btn-primary" data-classicon="icon-plus" data-buttontext="Chọn ảnh đăng" onchange="showimagepreview(this);return false;" id="File2" type="file" name="File2" value="<%=listFile.Count > 2 ? listFile[2].File: "" %>"><br />
                        <label class="fl">Ảnh 4</label>
                        <input class="filestyle" data-placeholder="Chưa có ảnh !" data-classbutton="btn btn-primary" data-classicon="icon-plus" data-buttontext="Chọn ảnh đăng" onchange="showimagepreview(this);return false;" id="File3" type="file" name="File3" value="<%=listFile.Count > 3 ? listFile[3].File: "" %>"><br />
                        <label class="fl">Ảnh 5</label>
                        <input class="filestyle" data-placeholder="Chưa có ảnh !" data-classbutton="btn btn-primary" data-classicon="icon-plus" data-buttontext="Chọn ảnh đăng" onchange="showimagepreview(this);return false;" id="File4" type="file" name="File4" value="<%=listFile.Count > 4 ? listFile[4].File: "" %>"><br />
                        <label class="fl">Ảnh 6</label>
                        <input class="filestyle" data-placeholder="Chưa có ảnh !" data-classbutton="btn btn-primary" data-classicon="icon-plus" data-buttontext="Chọn ảnh đăng" onchange="showimagepreview(this);return false;" id="File5" type="file" name="File5" value="<%=listFile.Count > 5 ? listFile[5].File: "" %>"><br />
                        <%}
                          else
                          {
                              if (arrfile != null && model.id > 0)
                              {
                                  var arrFiles = arrfile.Split('|');
                                  int i = 0;
                                  
                        %>

                        <div class="divImgEdit">
                            <%foreach (var file in arrFiles)
                              {
                                  if (!string.IsNullOrEmpty(file))
                                  {
                                      string file2 = !string.IsNullOrEmpty(file) ? file.Replace("~/", "/") : "";
                            %>
                            <label class="fl">
                                Ảnh <%=i + 1%><span class="red"> Chỉnh sửa
                            <input type="image" src="<%=file2%>" width="20" height="20" id="Image<%=i%>" alt="uploaded image preview" /></span></label>
                            <input class="filestyle" data-placeholder="<%=file2%>" data-classbutton="btn btn-primary" data-classicon="icon-plus" data-buttontext="Chọn ảnh sửa" onchange="showimagepreview(this);return false;" id="File<%=i ==  0 ? "" : i.ToString()%>" type="file" name="File<%=i ==  0 ? "" : i.ToString()%>" value="<%=file%>">
                            <br />
                            <%} i++;
                              } %>
                        </div>

                        <div class="divImgAdd">
                            <%for (int j = i; j >= 0 && j < 6; j++)
                              {
                            %>

                            <label class="fl">
                                Ảnh <%=j + 1%><span class="red"> Thêm mới
                            <input type="image" src="/Content/images/No_Image.png" width="20" height="20" id="Image<%=j%>" alt="uploaded image preview" /></span></label>
                            <input class="filestyle" data-placeholder="Chưa có ảnh !" data-classbutton="btn btn-primary" data-classicon="icon-plus" data-buttontext="Chọn ảnh đăng" onchange="showimagepreview(this);return false;" id="File<%=j %>" type="file" name="File<%=j ==  0 ? "" : j.ToString()%>" value="">
                            <br />

                            <%}%>
                        </div>
                        <%}
                          } %>
                    </div>
                    <div class="displayImg">
                        <input type="image" src="/Content/images/No_Image.png" width="180" height="180" id="imgprvw" alt="uploaded image preview" />
                    </div>



                    <%--                    <div style="display:none">
                         <input id="filex" type="file" name="filex" value="<%=listFile.Count > 0 ? listFile[0].File: "" %>">
                         <input id="filex1" type="file" name="filex1" value="<%=listFile.Count > 0 ? listFile[0].File: "" %>">
                         <input id="filex2" type="file" name="filex2" value="<%=listFile.Count > 0 ? listFile[0].File: "" %>">
                         <input id="filex3" type="file" name="filex3" value="<%=listFile.Count > 0 ? listFile[0].File: "" %>">
                         <input id="filex4" type="file" name="filex4" value="<%=listFile.Count > 0 ? listFile[0].File: "" %>">
                         <input id="filex5" type="file" name="filex5" value="<%=listFile.Count > 0 ? listFile[0].File: "" %>">
                    </div>--%>
                </li>
                <li>
                    <label class="fl">Địa chỉ<span class="red"> * </span></label>
                    <div class="ddlgr">
                        <div class="ddlvl">Tỉnh/Thành phố</div>
                        <select name="CityID" id="city_id" class="ddl" onchange="city_change(this.value); return false;">
                            <option value="0">- chọn tỉnh/thành -</option>
                            <%=Utils.ShowDDLMenuByType2("City", ViewPage.CurrentLang.ID, item.CityID) %>
                        </select>

                    </div>
                    <div class="ddlgr" id="list_district">
                        <div class="ddlvl">Quận/Huyện</div>
                        <select name="DistrictID" id="district_id" class="ddl" onchange="city_change_project(this.value); return false;">
                            <option value="0">- chọn quận/huyện -</option>
                        </select>
                    </div>
                    <div class="ddlgr" id="list_street">
                        <div class="ddlvl">Phường/Xã</div>
                        <select name="StreetID" id="street_id" class="ddl">
                            <option value="0">- chọn phường/xã -</option>
                        </select>
                    </div>

                </li>

                <li>
                    <label class="fl">Dự Án theo Quận Huyện</label>
                    <div class="ddlgr" id="list_Project">
                        <div class="ddlvl">Dự án</div>
                        <select name="ProjectID" id="ProjectID" class="ddl">
                            <option value="0">- Chọn Dự Án -</option>
                        </select>
                    </div>
                </li>
                <li>
                    <label class="fl">Hướng BĐS</label>
                    <div class="ddlgr">
                        <%--<div class="ddlvl">Tất cả</div>--%>
                        <select class="ddl w415px" name="DirectionsID" id="DirectionsID">
                            <option value="0">- Chọn Phương Hướng -</option>
                            <%=Utils.ShowDDLMenuByType2("Directions", ViewPage.CurrentLang.ID, item.DirectionsID) %>
                        </select>

                    </div>
                </li>
                <li>
                    <label>Maps</label>
                    <textarea name="Maps" id="Maps"></textarea>
                </li>
                <li>
                    <p class="text-ttlh">Thông tin Liên hệ</p>
                </li>
                <li>
                    <label>Tên liên lạc<span class="red"> * </span></label>
                    <input type="text" class="w415px" value="<%=user.Name %>" name="FullName" maxlength="255">
                </li>
                <li>
                    <label>Điện thoại<span class="red"> * </span></label>
                    <input type="text" class="w415px" maxlength="15" onkeypress='return event.charCode >= 48 && event.charCode <= 57' value="<%=user.Phone %>" name="MobiPhone">
                </li>
                <li>
                    <label>Địa Chỉ</label>
                    <input type="text" class="w415px" maxlength="255" id="Address" value="<%=user.Address %>" name="Address">
                </li>
                <li>
                    <label>Email</label>
                    <input type="text" class="w150px" value="<%=user.Email %>" name="Email" maxlength="255">
                    <%--<input type="checkbox" value="1" checked="checked">
                    <a>Nhận Email phản hồi</a>--%>
                </li>
                <li class="captcha-content">
                    <label>Mã xác thực<span class="red">*</span></label>
                    <input type="text" autocomplete="off" class="security w150px" name="ValidCode" id="ValidCode" value="" />
                    <img src="/Tools/Security.aspx" id="imgValidCode" alt="ValidCode" />
                    <a href="javascript:void(0)" class="recaptcha" onclick="change_captcha();" rel="nofollow">Đổi mã khác</a>
                </li>
                <li>
                    <label></label>
                    <input type="submit" value="Đăng tin" name="_vsw_action[AddPOST]" class="button-login" />
                    <input type="reset" value="Nhập lại" class="button-login" />
                </li>
            </ul>
        </div>
    </div>
</form>
<script>
    function ChangeisVip() {
        var firstday = new Date($("#DateStart").val().split("/").reverse().join(","));
        var lastday = new Date($("#datepicker").val().split("/").reverse().join(","));
        var days = (lastday - firstday) / 86400000;
        ChangeDate(lastday, days);
    }
    function ChangeDate(date, days) {
        var isVip = $("#isVip").val();
        //$("#datepickertxt2").text("ngay ket thuc " + date + "- vip" + isVip);
        //alert(date+ isVip);
        if (date != null) {
            var ranNum = Math.floor(Math.random() * 999999);
            sLink = '/Tools/GetHTML.aspx?cmd=get_dateVip&dateVip=' + date + '&days=' + days + '&isVip=' + isVip + '&id=<%=user.ID%>&RecordID=<%=model.RecordID > 0 ? model.RecordID : 0%>&rnd=' + ranNum;
            AjaxRequest.get(
                {
                    'url': sLink
                    , 'onSuccess': function (req) {
                        with (req.responseXML.getElementsByTagName('I').item(0)) {
                            var content = getNodeValue(getElementsByTagName('ListMenu'));
                            document.getElementById("datepickertxt2").innerHTML = content;
                        }
                    }
                    , 'onError': function (req) { }
                }
            )
        }




    }


    function ChangeType(id) {
        var parent_id = id.split("|")[0];
        var menu_id = id.split("|")[1];
        var dvprice_id = id.split("|")[2];
        var name = id.split("|")[3];
        $('#MenuID').val("");
        $('#TypeID').val(menu_id);
        $('#DVPrice').val(dvprice_id);
        if (parent_id > 0) {
            var ranNum = Math.floor(Math.random() * 999999);
            sLink = '/Tools/GetHTML.aspx?cmd=get_chid_menu2&parent_id=' + parent_id + '&select_id=<%=item.MenuID%>&rnd=' + ranNum;
            AjaxRequest.get(
                {
                    'url': sLink
                    , 'onSuccess': function (req) {
                        with (req.responseXML.getElementsByTagName('I').item(0)) {
                            var content = getNodeValue(getElementsByTagName('ListMenu'));
                            document.getElementById("DDLMenuID").innerHTML = '<option value="0">Chọn Danh mục</option>' + content;
                        }
                    }
                    , 'onError': function (req) { }
                }
            )

            document.getElementById("text1").innerHTML = name;
            document.getElementById("text2").innerHTML = "";
        } else {
            document.getElementById("DDLMenuID").innerHTML = '<option value="0">Chọn Danh mục</option>';
            document.getElementById("text1").innerHTML = "<<<<< Chọn Chuyên Mục";
            document.getElementById("text2").innerHTML = "";
            $('#MenuID').val("");
            $('#TypeID').val("");

        }

        if (dvprice_id == 1) {
            document.getElementById("DVPriceID").innerHTML = '<select name="DVPriceID" class="ddl" id="DVPriceID" name="DVPriceID" onchange="sum()" ><option value="0">- Thỏa thuận -</option><%=Utils.ShowDDLMenuByType2("DVPrice2", ViewPage.CurrentLang.ID, item.DVPriceID) %></select>';
        } else if (dvprice_id == -1) {
            document.getElementById("DVPriceID").innerHTML = '<select  name="DVPriceID" class="ddl" id="DVPriceID" name="DVPriceID" onchange="sum()" ><option value="0">- Thỏa thuận -</option><%=Utils.ShowDDLMenuByType2("DVPrice", ViewPage.CurrentLang.ID, item.DVPriceID) %></select>';
        }
        else {
            document.getElementById("DVPriceID").innerHTML = '<select name="DVPriceID" class="ddl" id="DVPriceID" name="DVPriceID" onchange="sum()" ><option value="0">- Thỏa thuận -</option><%=Utils.ShowDDLMenuByType2("DVPrice", ViewPage.CurrentLang.ID, item.DVPriceID) %><%=Utils.ShowDDLMenuByType2("DVPrice2", ViewPage.CurrentLang.ID, item.DVPriceID) %></select>';
        }


}

function ChangeMenu(id) {

    var id1 = id.split("|")[0];
    var name = id.split("|")[1];
    $('#MenuID').val(id1);
    document.getElementById("text2").innerHTML = " - " + name;
}


function city_change(city_id) {
    if (city_id > 0) {
        document.getElementById("list_street").innerHTML = '<select name="StreetID" id="street_id" class="ddl" ><option value="0">Chọn phường / xã</option></select>';
        document.getElementById("list_district").innerHTML = '<select name="DistrictID" id="district_id" class="ddl" ><option value="0">Chọn quận / huyện</option></select>';
        var ranNum = Math.floor(Math.random() * 999999);
        sLink = '/Tools/GetHTML.aspx?cmd=get_chid_menu&parent_id=' + city_id + '&select_id=<%=DistrictID%>&rnd=' + ranNum;
        AjaxRequest.get(
            {
                'url': sLink
                , 'onSuccess': function (req) {
                    with (req.responseXML.getElementsByTagName('I').item(0)) {
                        var content = getNodeValue(getElementsByTagName('ListMenu'));
                        document.getElementById("list_district").innerHTML = '<select name="DistrictID" id="district_id" class="ddl" onchange="city_change2(this.value),city_change_project(this.value); return false;"><option value="0">Chọn quận / huyện</option>' + content + '</select>';
                    }
                }
                , 'onError': function (req) { }
            }
        )
    } else {
        document.getElementById("list_district").innerHTML = '<select name="DistrictID" id="district_id" class="ddl" ><option value="0">Chọn quận / huyện</option></select>';
        document.getElementById("list_street").innerHTML = '<select name="StreetID" id="street_id" class="ddl" ><option value="0">Chọn phường / xã</option></select>';
    }
}

function city_change2(district_id) {
    if (district_id > 0) {
        var ranNum = Math.floor(Math.random() * 999999);
        sLink = '/Tools/GetHTML.aspx?cmd=get_chid_menu&parent_id=' + district_id + '&select_id=<%=StreetID%>&rnd=' + ranNum;
        AjaxRequest.get(
            {
                'url': sLink
                , 'onSuccess': function (req) {
                    with (req.responseXML.getElementsByTagName('I').item(0)) {
                        var content2 = getNodeValue(getElementsByTagName('ListMenu'));
                        document.getElementById("list_street").innerHTML = '<select name="StreetID" id="street_id" class="ddl" ><option value="0">Chọn phường / xã</option>' + content2 + '</select>';
                    }
                }
                , 'onError': function (req) { }
            }
        )
    } else {
        document.getElementById("list_street").innerHTML = '<select name="StreetID" id="street_id" class="ddl" ><option value="0">Chọn phường / xã</option></select>';
    }
}
function city_change_project(district_id) {
    if (district_id > 0) {
        var ranNum = Math.floor(Math.random() * 999999);
        sLink = '/Tools/GetHTML.aspx?cmd=get_project&District_ID=' + district_id + '&select_id=<%=DistrictID%>&rnd=' + ranNum;
        AjaxRequest.get(
            {
                'url': sLink
                , 'onSuccess': function (req) {
                    with (req.responseXML.getElementsByTagName('I').item(0)) {
                        var content3 = getNodeValue(getElementsByTagName('ListMenu'));
                        document.getElementById("list_Project").innerHTML = '<select id="ProjectID" name="ProjectID" class="ddl" ><option value="0">Chọn Dự án</option>' + content3 + '</select>';
                    }
                }
                , 'onError': function (req) { }
            }
        )
    } else {
        document.getElementById("list_Project").innerHTML = '<select id="ProjectID" name="ProjectID" class="ddl"><option value="0">Chọn Dự án</option></select>';
    }
}

</script>

<%-- ----------------------------------------------------------------- --%>

<script type="text/javascript">
    window.onload = check();
    window.onload = GetPrice();
</script>



<%-- ----------------------------------------------------------------- --%>
<script type="text/javascript" src="/Content/utils/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
    tinyMCE.init({
        mode: "exact",
        elements: "Content",
        theme: "advanced",
        height: "300px",
        width: "510px",
        //plugins: "paste,inlinepopups",
        theme_advanced_buttons1: "bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright, justifyfull,bullist,numlist,fontselect,fontsizeselect,forecolor,backcolor",
        //theme_advanced_buttons2: "fontselect,fontsizeselect,forecolor,backcolor,separator,link,unlink,,pasteword,removeformat",
        //theme_advanced_buttons3: "",
        theme_advanced_toolbar_location: "top",
        theme_advanced_toolbar_align: "left",
        //theme_advanced_font_sizes: "3,4,5,6",
        //theme_advanced_fonts: "Arial=arial;Verdana=verdana;Times New Roman=times new roman;Tahoma=tahoma",
        //theme_advanced_path_location : "bottom",
        //entity_encoding: "raw",
        language: 'vi'
    });
</script>
