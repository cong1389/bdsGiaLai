<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as ModVideoModel;
    var item = ViewBag.Data as ModVideoEntity;
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
            <h2>Video  : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
            <tr>
                <td class="key">
                    <label>Đường dẫn <a href="http://www.youtube.com/" target="_blank">Youtube.com</a> :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="File" value="<%=item.File %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    &nbsp;
                </td>
                <td>
                    <b style="font-style:italic; color:#878787;">Up file video lên <a href="http://www.youtube.com/" target="_blank">Youtube.com</a>, sau đó copy đường dẫn và dán vào đây.</b>
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
                                        <%= Utils.ShowDDLMenuByType("Video", model.LangID, item.MenuID)%>
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

</form>