<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as ModGalleryModel;
    var item = ViewBag.Data as ModGalleryEntity;
 %>

<form id="vswForm" name="vswForm" method="post">
<input type="hidden" id="_vsw_action" name="_vsw_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%= GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-article">
            <h2>Thư viện ảnh  : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Mã trên URL :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Code" value="<%=item.Code %>" maxlength="255" />
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
                                   Hình ảnh
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
                                        <%= Utils.ShowDDLMenuByType("Gallery", model.LangID, item.MenuID)%>
                                    </select>
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


                

                
            </div>
        </div> 
                  
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<script type="text/javascript">

    function refreshPage(arg) {
        arg = '~' + arg;
        document.getElementById(name_control).value = arg;
        if (document.getElementById("img_view"))
            document.getElementById("img_view").src = arg.replace('~/', '/{ApplicationPath}');
    }

</script>

</form>