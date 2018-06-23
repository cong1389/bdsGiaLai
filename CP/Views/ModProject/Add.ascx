<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as ModProjectModel;
    var item = ViewBag.Data as ModProjectEntity;
 %>

<form id="vswForm" name="vswForm" method="post">
<input type="hidden" id="_vsw_action" name="_vsw_action" />
<input type="hidden" name="Files" id="Files" value="" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%= GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-article">
            <h2>Dự án  : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<div class="clr"></div>

<%= ShowMessage()%>

<script type="text/javascript">
    window.addEvent('domready', function () { new Accordion($$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler'), $$('div#content-sliders-.pane-sliders > .panel > div.pane-slider'), { onActive: function (toggler, i) { toggler.addClass('pane-toggler-down'); toggler.removeClass('pane-toggler'); i.addClass('pane-down'); i.removeClass('pane-hide'); Cookie.write('jpanesliders_content-sliders-', $$('div#content-sliders-.pane-sliders > .panel > h3').indexOf(toggler)); }, onBackground: function (toggler, i) { toggler.addClass('pane-toggler'); toggler.removeClass('pane-toggler-down'); i.addClass('pane-hide'); i.removeClass('pane-down'); if ($$('div#content-sliders-.pane-sliders > .panel > h3').length == $$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler').length) Cookie.write('jpanesliders_content-sliders-', -1); }, duration: 300, opacity: false, alwaysHide: true }); });
</script>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
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
                    <input class="text_input" type="text" name="Name" value="<%=item.Name %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Diện tích :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="PriceText" value="<%=item.Square %>" maxlength="255" />
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Mô tả :</label>
                </td>
                <td>
                    <textarea class="text_input" style="height:100px;width:98%" name="Summary"><%=item.Summary%></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="text-align:center" class="key">
                   NỘI DUNG
                </td>
            </tr>
            <tr>
                <td colspan="2" class="content">
                    <textarea class="ckeditor" style="width:100%;height:500px" name="Content" id="Content"><%=item.Content%></textarea>
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
                                <td align="center" style="text-align:center" class="key">
                                   Hình minh họa
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
                                        <input class="text_input" type="text" name="File" id="File" style="width:65%" value="<%=item.File %>" />
                                        <input class="text_input" style="width:75px;" type="button" onclick="ShowFileForm('File');return false;" value="Chọn ảnh" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="text-align:center" class="key">
                                  Chuyên mục
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <select name="MenuID" id="MenuID" class="text_input">
                                        <option value="0">Root</option>
                                        <%= Utils.ShowDDLMenuByType("Project", model.LangID, item.MenuID)%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="text-align:center" class="key">
                                  Tỉnh thành
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <select name="CityID" id="CityID" class="text_input" onchange="city_change(this.value); return false;">
                                        <option value="0">Root</option>
                                        <%= Utils.ShowDDLMenuByType2("City", model.LangID, item.CityID)%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="text-align:center" class="key">
                                  Quận huyện
                                </td>
                            </tr>
                            <tr>
                                <td id="list_district">
                                   <select name="DistrictID" id="DistrictID" class="text_input">
                                        <option value="0">Root</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="text-align:center" class="key">
                                   Vị trí
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <%= Utils.ShowCheckBoxByConfigkey("Mod.ProjectState", "ArrState", item.State)%>
                                </td>
                            </tr>
                           
                            <%if(CPViewPage.UserPermissions.Approve) {%>
                            <tr>
                                <td align="center" style="text-align:center" class="key">
                                   Duyệt
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input name="Activity" <%= item.Activity ? "checked" : "" %> type="radio" value='1' /> Có
                                    <input name="Activity" <%= !item.Activity ? "checked" : "" %> type="radio" value='0' /> Không
                                </td>
                            </tr>
                            <%} %>

                          </table>
                    </div>
                </div>


                <div class="panel">
                    <h3 class="pane-toggler title" id="publishing-details">
                        <a href="javascript:void(0);"><span>SEO</span></a></h3>
                    <div class="pane-slider content">
                         <table class="admintable">
                            <tr>
                                <td align="center" style="text-align:center" class="key">
                                    <label>[SEO] Tiêu đề trang :</label>
                                </td></tr>
                            <tr>
                                <td>
                                    <input class="text_input" type="text" name="PageTitle" value="<%=item.PageTitle %>" maxlength="255" />
                                </td>
                            </tr>
                             <tr>
                                <td align="center" style="text-align:center" class="key">
                                    <label>[SEO] Mô tả trang:</label>
                                </td></tr>
                            <tr>
                                <td>
                                    <textarea class="text_input" style="height:100px;" name="PageDescription" id="PageDescription"><%=item.PageDescription%></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="text-align:center" class="key">
                                    <label>[SEO] Từ khóa trang:</label>
                                </td></tr>
                            <tr>
                                <td>
                                    <textarea class="text_input" style="height:100px;" name="PageKeywords" id="PageKeywords"><%=item.PageKeywords%></textarea>
                                </td>
                            </tr>

                          </table>
                    </div>
                </div>
                
            </div>
        </div> 
                  
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
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

	                document.getElementById("list_district").innerHTML ='<select name="DistrictID" id="DistrictID" class="text_input"><option value="0">Root</option>' + content + '</select>';

	                //if (js != '')
	                //    eval(js);
	            }
	        }
	        , 'onError': function (req) { }
	        }
        )
    }

    if(<%=item.CityID%> > 0) city_change('<%=item.CityID%>');
    else if(document.getElementById('CityID').value > 0) city_change(document.getElementById('CityID').value);

</script>

</form>