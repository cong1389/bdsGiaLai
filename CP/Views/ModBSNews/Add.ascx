<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl" %>

<% 
    var model = ViewBag.Model as ModBSNewsModel;
    var item = ViewBag.Data as ModBSNewsEntity;
    var listFiles = item.getFiles();
%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
    $(function () {
        $("#datepicker").datepicker({ minDate: +0, maxDate: "+12M +0D", dateFormat: 'dd/mm/yy', altField: '#DateStart', defaultDate: +0 });
    })
</script>
<form id="vswForm" name="vswForm" method="post">
    <input type="hidden" id="_vsw_action" name="_vsw_action" />
    <input type="hidden" name="Files" id="Files" value="" />
    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <%= GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-article">
                <h2>Tin rao vặt  : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>
    <div class="clr"></div>

    <%= ShowMessage()%>

    <script type="text/javascript">
        window.addEvent('domready', function () { new Accordion($$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler'), $$('div#content-sliders-.pane-sliders > .panel > div.pane-slider'), { onActive: function (toggler, i) { toggler.addClass('pane-toggler-down'); toggler.removeClass('pane-toggler'); i.addClass('pane-down'); i.removeClass('pane-hide'); Cookie.write('jpanesliders_content-sliders-', $$('div#content-sliders-.pane-sliders > .panel > h3').indexOf(toggler)); }, onBackground: function (toggler, i) { toggler.addClass('pane-toggler'); toggler.removeClass('pane-toggler-down'); i.addClass('pane-hide'); i.removeClass('pane-down'); if ($$('div#content-sliders-.pane-sliders > .panel > h3').length == $$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler').length) Cookie.write('jpanesliders_content-sliders-', -1); }, duration: 300, opacity: false, alwaysHide: true }); });
    </script>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">

            <div class="width-70 fltlft">
                <fieldset class="adminform">
                    <legend>THÔNG TIN CHUNG</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Tiêu đề :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Name" value="<%=item.Name %>" maxlength="500" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Code :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Code" value="<%=item.Code %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Diện tích :</label>
                            </td>
                            <td>
                                <input style="width: 130px;" class="text_input" type="text" onkeypress='return validateQty(event)' onkeyup="GetPrice()" name="Square" id="Square" value="<%=item.Square %>" />
                                <span class="red" id="SquareOut"></span><span style="color: red">(m<sup>2</sup>)</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Giá tiền :</label>
                            </td>
                            <td>
                                <input style="width: 200px;" class="text_input" autocomplete="off" type="text" name="Price" id="Price" onkeypress='return validateQty(event)' onkeyup="GetPrice()" value="<%=item.Price %>" />
                                <input type="hidden" name="TotalPrice" id="TotalPrice" value="" />
                                <select style="width: 200px;" class="text_input" id="DVPriceID" name="DVPriceID" onchange="GetPrice()">
                                    <option value="0">- Thỏa thuận -</option>
                                    <%=Utils.ShowDDLMenuByType2("DVPrice", model.LangID, item.DVPriceID) %>
                                    <%=Utils.ShowDDLMenuByType2("DVPrice2",  model.LangID, item.DVPriceID) %>
                                </select>
                                <br />
                                <span class="red" id="display_price"><%=item.TotalPrice %></span>

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
                                        }

                                        $('#TotalPrice').val(value);

                                        //var html_value = value.digits() + ' ' + $('#DVPriceID option:selected').text();
                                        var html_value = addCommas(value) + ' ' + $('#DVPriceID option:selected').text();
                                        $('#display_price').html(html_value);
                                    }
                                </script>
                            </td>
                        </tr>
                         <tr>
                            <td class="key">
                                <label>Giá (Text) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text"  name="PriceText" id="PriceText" value="<%=item.PriceText %>"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại :</label>
                            </td>
                            <td>
                                <input style="width: 200px;" class="text_input" type="text" maxlength="15" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="MobiPhone" id="MobiPhone" value="<%=item.MobiPhone %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Tên:</label>
                            </td>
                            <td>
                                <input style="width: 200px;" class="text_input" type="text" maxlength="225" name="FullName" id="FullName" value="<%=item.FullName %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Địa chỉ  :</label>
                            </td>
                            <td>
                                <input style="width: 200px;" class="text_input" type="text" maxlength="225" name="Address" id="Address" value="<%=item.Address %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Email :</label>
                            </td>
                            <td>
                                <input style="width: 200px;" class="text_input" type="text" maxlength="225" name="Email" id="Email" value="<%=item.Email %>" />
                            </td>
                        </tr>
                       
                        <tr>
                            <td colspan="2" align="center" style="text-align: center" class="key">NỘI DUNG
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="content">
                                <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=item.Content%></textarea>
                            </td>
                        </tr>
                         <tr>
                            <td colspan="2" align="center" style="text-align: center" class="key">Tóm tắt
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="content">
                                <textarea style="width: 100%; height: 100px" name="Summary" id="Summary"><%=item.Summary%></textarea>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div class="width-30 fltrt">
                <div id="content-sliders-" class="pane-sliders">

                    <div class="panel">
                        <h3 class="pane-toggler title" id="publishing-details">
                            <a href="javascript:void(0);"><span>THUỘC TÍNH</span></a></h3>
                        <div class="pane-slider content">
                            <table class="admintable">
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Sảnh phẩm Vip
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%= Utils.ShowRadioByConfigkey("Mod.BSNewsVip", "isVip", item.isVip)%>
                                    </td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="DateStart" id="DateStart" value="<%= string.Format("{0:dd/MM/yyyy}", DateTime.Now )%>">
                                    <td>Ngày bắt đầu:<input name="datepicker" style="width: 100px;" type="text" class="text_input" readonly="true" id="datepicker" value="<%= string.Format("{0:dd/MM/yyyy}", DateTime.Now) %>">
                                    </td>

                                </tr>
                                <tr>
                                    <td>Ngày kết thúc:
                                        <input onkeypress="return validateQty(event)" name="DateEnd" class="text_input" type="text" value="" style="width: 100px;" /><span> Ngày</span>
                                        <%if (model.RecordID > 0)
                                          { %>
                                    ->
                                        <input class="text_input" style="width: 100px;" readonly="true" type="text" value="<%= string.Format("{0:dd/MM/yyyy}", item.DateEnd) %>" />
                                        <%} %>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Hình minh họa
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%if (!string.IsNullOrEmpty(item.File))
                                          { %>
                                        <%= Utils.GetMedia(item.File, 100, 80, string.Empty, true, "id='img_view'")%><%}
                                          else
                                          { %>
                                        <img id="img_view" width="100" height="80" />
                                        <%} %>
                                        <br />
                                        <input class="text_input" type="text" name="File" id="File" style="width: 65%" value="<%=item.File %>" />
                                        <input class="text_input" style="width: 75px;" type="button" onclick="ShowFileForm('File');return false;" value="Chọn ảnh" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Hình Thêm
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input class="addfile" type="text" name="add_file" id="add_file" value="Click vào đây để chọn file" onclick="ShowFileForm('add_file'); return false;" />
                                        <input class="selectfile" type="button" onclick="add(); return false;" value="Thêm ảnh" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100%">
                                        <div id="list_file"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: left" class="key">Chuyên mục
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="TypeID" id="TypeID" class="text_input" onchange="type_change(this.value); return false;">
                                            <option value="0" data-type="0">Root</option>
                                            <%= Utils.ShowDDLMenuByType3("BSNews", model.LangID, item.TypeID)%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Danh mục
                                    </td>
                                </tr>
                                <tr id="list_menu">
                                    <td>
                                        <select name="MenuID" id="MenuID" class="text_input">
                                            <option value="0">Root</option>
                                            <%= Utils.ShowDDLMenuByType("BSNews", model.LangID, item.MenuID)%>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" style="text-align: left" class="key">Phương hướng
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="DirectionsID" id="DirectionsID" class="text_input">
                                            <option value="0">Root</option>
                                            <%=Utils.ShowDDLMenuByType2("Directions", model.LangID, item.DirectionsID) %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Tỉnh thành
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="CityID" id="CityID" class="text_input" onchange="city_change(this.value); return false;">
                                            <%-- <option value="0">Root</option>--%>
                                            <%= Utils.ShowDDLMenuByType2("City", model.LangID, item.CityID)%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: left" class="key">Quận huyện
                                    </td>
                                </tr>
                                <tr>
                                    <td id="list_district">
                                        <select name="DistrictID" id="DistrictID" class="text_input" onchange="project_change(this.value); return false;">
                                            <%= Utils.ShowDDLMenuByType2("City", model.LangID, item.DistrictID)%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Phường Xã
                                    </td>
                                </tr>
                                <tr>
                                    <td id="list_street">
                                        <select name="StreetID" id="StreetID" class="text_input">
                                            <%= Utils.ShowDDLMenuByType2("City", model.LangID, item.StreetID)%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: left" class="key">Dự án
                                    </td>
                                </tr>
                                <tr>
                                    <td id="list_Project">
                                        <select name="ProjectID" id="ProjectID" class="text_input">
                                            <option value="0">Chọn dự án</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Vị trí
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%= Utils.ShowCheckBoxByConfigkey("Mod.BSNewsState", "ArrState", item.State)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: left" class="key">Ngày sửa
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input name="isSetDate" checked="checked" type="radio" value='1' />
                                        Có (Ngày hiện tại)
                                    <input name="isSetDate" type="radio" value='0' />
                                        Không (Ngày trước đó)
                                    </td>
                                </tr>
                                <%if (CPViewPage.UserPermissions.Approve)
                                  {%>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Duyệt
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input name="Activity" <%= item.Activity ? "checked" : "" %> type="radio" value='1' />
                                        Có
                                    <input name="Activity" <%= !item.Activity ? "checked" : "" %> type="radio" value='0' />
                                        Không
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                        </div>
                    </div>
                    <div class="panel">
                        <h3 class="pane-toggler title" id="H1">
                            <a href="javascript:void(0);"><span>SEO</span></a></h3>
                        <div class="pane-slider content">
                            <table class="admintable">
                                <tr>
                                    <td align="center" style="text-align: center" class="key">
                                        <label>[SEO] Tiêu đề trang :</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input class="text_input" type="text" name="PageTitle" value="<%=item.PageTitle %>" maxlength="255" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">
                                        <label>[SEO] Mô tả trang:</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <textarea class="text_input" style="height: 100px;" name="PageDescription" id="PageDescription"><%=item.PageDescription%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">
                                        <label>[SEO] Từ khóa trang:</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <textarea class="text_input" style="height: 100px;" name="PageKeywords" id="PageKeywords"><%=item.PageKeywords%></textarea>
                                    </td>
                                </tr>

                            </table>
                        </div>
                    </div>

                </div>
            </div>

            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');

        function refreshPage(arg) {
            arg = '~' + arg;
            document.getElementById(name_control).value = arg;
            if (document.getElementById("img_view"))
                document.getElementById("img_view").src = arg.replace('~/', '/{ApplicationPath}');
        }

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

        function changedateend() {
            //document.getElementById("DateEnd").value = document.getElementById("DateEnd").innerText;
            var t = document.getElementById("DateEnd").textContent;
        }
             <%
        if (item.CityID > 0)
    {%>
        city_change(<%=item.CityID%>);
        <%}
              if (item.DistrictID > 0)
    {%>
        district_change(<%=item.DistrictID%>);
    <%}
        if (item.MenuID > 0)
    {%>
        type_change(<%=item.TypeID%>);
    <%}
        if (item.DistrictID > 0)
    {%>
        project_change(<%=item.DistrictID%>);
    <%}
    %>
            function city_change(city_id) {
                var ranNum = Math.floor(Math.random() * 999999);
                sLink = '/{CPPath}/Ajax/GetDistrictByCity.aspx/CityID/' + city_id + '/SelectedID/<%=item.DistrictID%>?rnd=' + ranNum;
                AjaxRequest.get(
                    {
                        'url': sLink
                    , 'onSuccess': function (req) {
                        with (req.responseXML.getElementsByTagName('Item').item(0)) {
                            //var js = getNodeValue(getElementsByTagName('JS'));
                            var content = getNodeValue(getElementsByTagName('Html'));

                            document.getElementById("list_district").innerHTML ='<select name="DistrictID" id="DistrictID" class="text_input" onchange="district_change(this.value),project_change(this.value); return false;"><option value="0">Root</option>' + content + '</select>';

                            //if (js != '')
                            //    eval(js);
                        }
                    }
                    , 'onError': function (req) { }
                    }
                )
            }


        function district_change(district_id) {
            var ranNum = Math.floor(Math.random() * 999999);
            sLink = '/{CPPath}/Ajax/GetStreet.aspx/DistrictID/' + district_id + '/SelectedID/<%=item.StreetID%>?rnd=' + ranNum;
            AjaxRequest.get(
                {
                    'url': sLink
                , 'onSuccess': function (req) {
                    with (req.responseXML.getElementsByTagName('Item').item(0)) {
                        //var js = getNodeValue(getElementsByTagName('JS'));
                        var content = getNodeValue(getElementsByTagName('Html'));

                        document.getElementById("list_street").innerHTML ='<select name="StreetID" id="StreetID" class="text_input"><option value="0">Root</option>' + content + '</select>';
                        //if (js != '')
                        //    eval(js);
                    }
                }
                , 'onError': function (req) { }
                }
            )
        }
        function type_change(type_id) {
            var ranNum = Math.floor(Math.random() * 999999);
            sLink = '/{CPPath}/Ajax/GetDistrictByCity.aspx/CityID/' + type_id + '/SelectedID/<%=item.MenuID%>?rnd=' + ranNum;
            AjaxRequest.get(
                {
                    'url': sLink
                , 'onSuccess': function (req) {
                    with (req.responseXML.getElementsByTagName('Item').item(0)) {
                        //var js = getNodeValue(getElementsByTagName('JS'));
                        var content = getNodeValue(getElementsByTagName('Html'));
                        document.getElementById("list_menu").innerHTML ='<select name="MenuID" id="MenuID" class="text_input"><option value="0">Root</option>' + content + '</select>';
                        //if (js != '')
                        //    eval(js);
                    }
                }
                , 'onError': function (req) { }
                }
            )
        }


        function project_change(district_id) {
            var ranNum = Math.floor(Math.random() * 999999);
            sLink = '/{CPPath}/Ajax/GetProject.aspx/DistrictID/' + district_id + '/SelectedID/<%=item.ProjectID%>?rnd=' + ranNum;
            AjaxRequest.get(
                {

                    'url': sLink
                , 'onSuccess': function (req) {

                    with (req.responseXML.getElementsByTagName('Item').item(0)) {
                        var content3 = getNodeValue(getElementsByTagName('Html'));
                        document.getElementById("list_Project").innerHTML = '<select id="ProjectID" name="ProjectID" class="text_input" ><option value="0">Chọn Dự án</option>' + content3 + '</select>';
                        //if (js != '')

                    }
                }
                , 'onError': function (req) { }
                }
            )
        }


        var arrFiles = new Array();

        <% for (int i = 0; listFiles != null && i < listFiles.Count; i++)
           { %>
        arrFiles.push('<%=listFiles[i].File.Replace("~/","/") %>');
        <%} %>

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
    <script type="text/javascript" src="/{CPPath}/Content/add/js/file.js"></script>
    <link rel="stylesheet" href="/{CPPath}/Content/add/css/file.css" type="text/css" />
</form>
