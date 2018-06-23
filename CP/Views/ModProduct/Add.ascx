<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as ModProductModel;
    var item = ViewBag.Data as ModProductEntity;
    var listFiles = item.getFiles();
    
    //string ListPropertyValueID = ViewBag.ListPropertyValueID;
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
            <h2>Sản phẩm  : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
            <%--<tr>
                <td class="key">
                    <label>Mã trên URL :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Code" value="<%=item.Code %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Mã sản phẩm :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Model" value="<%=item.Model %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Bảo hành :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Warranty" value="<%=item.Warranty %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Giá khuyến mại :</label>
                </td>
                <td>
                    <input style="width: 100px;" class="text_input" type="text" name="Price2" id="Price2" onkeyup="document.getElementById('sp_Price2').innerHTML = formatDollar(this.value);" value="<%=item.Price2 %>" maxlength="255" /> 
                    <span id="sp_Price2" style="font-style: italic; color:#4B4B4B;">(<%=ReadPrice.ConvertNumberToText(item.Price2)%>)</span>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Giá bán :</label>
                </td>
                <td>
                    <input style="width: 100px;" class="text_input" type="text" name="Price" id="Price" onkeyup="document.getElementById('sp_Price').innerHTML = formatDollar(this.value);" value="<%=item.Price %>" maxlength="255" /> 
                    <span id="sp_Price" style="font-style: italic; color:#4B4B4B;">(<%=ReadPrice.ConvertNumberToText(item.Price)%>)</span>
                </td>
            </tr>
            <%if (model.RecordID > 0){%>
            <tr>
                <td class="key">
                    <label>Loại sản phẩm :</label>
                </td>
                <td>
                     <select name="TypeID" id="TypeID" class="text_input" onchange="type_change(this.value);">
                         <option value="0">- Chọn loại sản phẩm -</option>
                         <%= Utils.ShowDDLMenuByType2("Property", model.LangID, item.TypeID)%> 
                    </select>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Các thuộc tính :</label>
                </td>
                <td>
                    <div id="list_property"></div>
                </td>
            </tr>
            <%} %>
            <tr>
                <td class="key">
                    <label>Mô tả :</label>
                </td>
                <td>
                    <textarea class="text_input" style="height:100px;width:98%" name="Summary"><%=item.Summary%></textarea>
                </td>
            </tr>--%>
            <tr>
                <td colspan="2" align="center" style="text-align:center" class="key">
                   MÔ TẢ
                </td>
            </tr>
            <tr>
                <td colspan="2" class="content">
                    <textarea class="ckeditor" style="width:100%;height:500px" name="Content2" id="Content2"><%=item.Content2%></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="text-align:center" class="key">
                   CHI TIẾT & KÍCH THƯỚC
                </td>
            </tr>
            <tr>
                <td colspan="2" class="content">
                    <textarea class="ckeditor" style="width:100%;height:500px" name="Content" id="Content"><%=item.Content%></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="text-align:center" class="key">
                   BẢO DƯỠNG & ĐIỀU CHỈNH
                </td>
            </tr>
            <tr>
                <td colspan="2" class="content">
                    <textarea class="ckeditor" style="width:100%;height:500px" name="Content3" id="Content3"><%=item.Content3%></textarea>
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
                                  Chuyên mục
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <select name="MenuID" id="MenuID" class="text_input">
                                        <option value="0">Root</option>
                                        <%= Utils.ShowDDLMenuByType("Product", model.LangID, item.MenuID)%>
                                    </select>
                                </td>
                            </tr>
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
                                <td align="center" style="text-align: center" class="key">
                                    Hình ảnh thêm
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="addfile" type="text" name="add_file" id="add_file" value="Click vào đây để chọn file"
                                        onclick="ShowFileForm('add_file'); return false;" />
                                    <input class="selectfile" type="button" onclick="add(); return false;" value="Thêm ảnh" />
                                </td>
                            </tr>
                            <tr>
                                <td width="100%">
                                    <div id="list_file"></div>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="text-align:center" class="key">
                                   Vị trí
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <%= Utils.ShowCheckBoxByConfigkey("Mod.ProductState", "ArrState", item.State)%>
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
</script>

<script type="text/javascript">

    var arrFiles = new Array();

    <% for(int i=0;listFiles!=null && i < listFiles.Count;i++){ %>
        arrFiles.push('<%=listFiles[i].File.Replace("~/","/") %>');
    <%} %>

</script>
<script type="text/javascript" src="/{CPPath}/Content/add/js/file.js"></script>
<link rel="stylesheet" href="/{CPPath}/Content/add/css/file.css" type="text/css" />

</form>