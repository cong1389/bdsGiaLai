<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<%= ShowMessage()%>

<script type="text/javascript">
    window.addEvent('domready', function () { new Accordion($$('div#panel-sliders.pane-sliders > .panel > h3.pane-toggler'), $$('div#panel-sliders.pane-sliders > .panel > div.pane-slider'), { onActive: function (toggler, i) { toggler.addClass('pane-toggler-down'); toggler.removeClass('pane-toggler'); i.addClass('pane-down'); i.removeClass('pane-hide'); Cookie.write('jpanesliders_panel-sliders', $$('div#panel-sliders.pane-sliders > .panel > h3').indexOf(toggler)); }, onBackground: function (toggler, i) { toggler.addClass('pane-toggler'); toggler.removeClass('pane-toggler-down'); i.addClass('pane-hide'); i.removeClass('pane-down'); if ($$('div#panel-sliders.pane-sliders > .panel > h3').length == $$('div#panel-sliders.pane-sliders > .panel > h3.pane-toggler').length) Cookie.write('jpanesliders_panel-sliders', -1); }, duration: 300, opacity: false, alwaysHide: true }); });
</script>

<div id="element-box">
    <div class="t">
        <div class="t"><div class="t"></div></div>
    </div>
    <div class="m">
        <div class="adminform">
            <div class="cpanel-left">

                <div id="cpanel">

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModNews/Add.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-article-add.png"
                                    alt="" />
                                <span>Thêm bài viết</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModNews/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-article.png" alt="" />
                                <span>Bài viết</span></a>
                        </div>
                    </div>
                     <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModBSNews/Add.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-article-edit.png" alt="" />
                                <span>Thêm tin</span></a>
                        </div>
                    </div>
                       <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModBSNews/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-stats.png" alt="" />
                                <span>Danh sách Tin</span></a>
                        </div>
                    </div>
                       <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModBSNewsEnd/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-extension.png" alt="" />
                                <span>Tin hết hạn</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysMenu/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-category.png" alt="" />
                                <span>Chuyên mục</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModAdv/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-media.png" alt="" />
                                <span>Quảng cáo/Liên kết</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModFeedback/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-massmail.png" alt="" />
                                <span>Liên hệ</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModFile/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-section.png"
                                    alt="" />
                                <span>File tải lên</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysPage/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-menumgr.png" alt="" />
                                <span>Trang</span></a>
                        </div>
                    </div>

                     <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysTemplate/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-themes.png" alt="" />
                                <span>Mẫu giao diện</span></a>
                        </div>
                    </div>

                   <%-- <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysModule/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-plugin.png" alt="" />
                                <span>Chức năng</span></a>
                        </div>
                    </div>--%>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysResource/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-language.png" alt="" />
                                <span>Tài nguyên</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysUser/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-user.png" alt="" />
                                <span>Người sử dụng</span></a>
                        </div>
                    </div>
                   
                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysUserLog/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-user-profile.png"
                                    alt="" />
                                <span>Nhật ký đăng nhập</span></a>
                        </div>
                    </div>
                     <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/WebSetting/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-cpanel.png"
                                    alt="" />
                                <span>Cấu hình</span></a>
                        </div>
                    </div>
                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="#" onclick="vsw_exec_cmd('config')">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-purge.png"
                                    alt="xóa cache" />
                                <span>Xóa Cahe</span></a>
                        </div>
                    </div>

                </div>
            
            </div>
            <div class="cpanel-right">

                <div id="panel-sliders" class="pane-sliders">
                    
                    <% var listUserLog = CPUserLogService.Instance.CreateQuery()
                            .Take(5)
                            .OrderByDesc(o => o.ID)
                            .ToList(); %>
                    <div class="panel">
                        <h3 class="pane-toggler title" id="cpanel-panel-logged">
                            <a href="javascript:void(0);"><span>5 đăng nhập gần nhất</span></a>
                        </h3>
                        <div class="pane-slider content">
                            <table class="adminlist">
                                <thead>
                                    <tr>
                                        <th>
                                            #
                                        </th>
                                        <th>
                                            <strong>Ghi chú</strong>
                                        </th>
                                        <th>
                                            <strong>IP</strong>
                                        </th>
                                        <th>
                                            <strong>Ngày</strong>
                                        </th>
                                        <th>
                                            <strong>ID</strong>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <%for (int i = 0; listUserLog != null && i < listUserLog.Count; i++)
                                   { %>
                                    <tr>
                                        <td>
                                            <%= listUserLog[i].getUser() != null ? listUserLog[i].getUser().LoginName : string.Empty%>
                                        </td>
                                        <td class="center">
                                            <%= listUserLog[i].Note%>
                                        </td>
                                        <td class="center">
                                            <%= listUserLog[i].IP%>
                                        </td>
                                        <td class="center">
                                            <%= string.Format("{0:dd-MM-yyyy HH:mm}", listUserLog[i].Created)%>
                                        </td>
                                        <td class="center">
                                           <%= listUserLog[i].ID%>
                                        </td>
                                    </tr>
                                   <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <% var listNews = ModNewsService.Instance.CreateQuery()
                            .Take(5)
                            .OrderByDesc(o => o.ID)
                            .ToList(); %>
                    <div class="panel">
                        <h3 class="pane-toggler title" id="cpanel-panel-latest">
                            <a href="javascript:void(0);"><span>5 bài viết mới</span></a>
                        </h3>
                        <div class="pane-slider content">
                            <table class="adminlist">
                                <thead>
                                    <tr>
                                        <th>
                                            Tiêu đề
                                        </th>
                                        <th>
                                            <strong>Duyệt</strong>
                                        </th>
                                        <th>
                                            <strong>Xuất bản</strong>
                                        </th>
                                        <th>
                                            <strong>Chuyên mục</strong>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; listNews != null && i < listNews.Count; i++)
                                      { %>
                                    <tr>
                                        <td>
                                            <a href="/{CPPath}/ModNews/Add.aspx/RecordID/<%= listNews[i].ID%>/LangID/<%= listNews[i].getMenu().LangID%>"><%= listNews[i].Name%></a>
                                        </td>
                                        <td class="center">
                                            <span class="jgrid">
                                               <span class="state <%= listNews[i].Activity ? "publish" : "unpublish" %>"></span>
                                            </span>
                                        </td>
                                        <td class="center">
                                            <%= string.Format("{0:dd-MM-yyyy HH:mm}", listNews[i].Published)%>
                                        </td>
                                        <td class="center">
                                           <%= GetName(listNews[i].getMenu())%>
                                        </td>
                                    </tr>
                                   <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                     <% var listBDS = ModBSNewsService.Instance.CreateQuery()
                            .Take(5)
                            .OrderByDesc(o => o.ID)
                            .ToList(); %>
                    <div class="panel">
                        <h3 class="pane-toggler title" id="cpanel-panel-latest">
                            <a href="javascript:void(0);"><span>5 rao vặt mới</span></a>
                        </h3>
                        <div class="pane-slider content">
                            <table class="adminlist">
                                <thead>
                                    <tr>
                                        <th>
                                            Tiêu đề
                                        </th>
                                        <th>
                                            <strong>Duyệt</strong>
                                        </th>
                                        <th>
                                            <strong>Xuất bản</strong>
                                        </th>
                                        <th>
                                            <strong>Chuyên mục</strong>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; listBDS != null && i < listBDS.Count; i++)
                                      { %>
                                    <tr>
                                        <td>
                                            <a href="/{CPPath}/ModBSNews/Add.aspx/RecordID/<%= listBDS[i].ID%>/LangID/<%= listBDS[i].getMenu().LangID%>"><%= listBDS[i].Name%></a>
                                        </td>
                                        <td class="center">
                                            <span class="jgrid">
                                               <span class="state <%= listBDS[i].Activity ? "publish" : "unpublish" %>"></span>
                                            </span>
                                        </td>
                                        <td class="center">
                                            <%= string.Format("{0:dd-MM-yyyy HH:mm}", listBDS[i].Created)%>
                                        </td>
                                        <td class="center">
                                           <%= GetName(listBDS[i].getMenu())%>
                                        </td>
                                    </tr>
                                   <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="panel">
                        <h3 class="pane-toggler title" id="cpanel-panel-latest">
                            <a href="javascript:void(0);"><span>10 rao vặt Vip & Siêu Vip mới</span></a>
                        </h3>
                        <div class="pane-slider content">
                            <table class="adminlist">
                                <thead>
                                    <tr>
                                        <th>
                                            Tiêu đề
                                        </th>
                                        <th>
                                            <strong>Duyệt</strong>
                                        </th>
                                         <th>
                                            <strong>Vip/SieuVip</strong>
                                        </th>
                                        <th>
                                            <strong>Xuất bản</strong>
                                        </th>
                                        <th>
                                            <strong>Chuyên mục</strong>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                      <% var listBDSVip = ModBSNewsService.Instance.CreateQuery()
                            .Take(10)
                            .Where(o => o.isVip == 3 || o.isVip == 2)
                            .OrderByDesc(o => o.ID)
                            .ToList(); %>
                                    <%for (int u = 0; listBDSVip != null && u < listBDSVip.Count; u++)
                                      { %>
                                    <tr>
                                        <td>
                                            <a href="/{CPPath}/ModBSNews/Add.aspx/RecordID/<%= listBDSVip[u].ID%>/LangID/<%= listBDSVip[u].getMenu().LangID%>"><%= listBDSVip[u].Name%></a>
                                        </td>
                                        <td class="center">
                                            <span class="jgrid">
                                               <span class="state <%= listBDSVip[u].Activity ? "publish" : "unpublish" %>"></span>
                                            </span>
                                        </td>
                                        <td class="center">
                                               <span style="color:#<%= listBDSVip[u].isVip == 2 ? "00ff21" : "f00" %>"><%= listBDSVip[u].isVip == 2 ? "Vip" : "S-Vip" %></span>
                                        </td>
                                        <td class="center">
                                            <%= string.Format("{0:dd-MM-yyyy HH:mm}", listBDSVip[u].Created)%>
                                        </td>
                                        <td class="center">
                                           <%= GetName(listBDSVip[u].getMenu())%>
                                        </td>
                                    </tr>
                                   <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b">
        <div class="b"><div class="b"></div></div>
    </div>
</div>
