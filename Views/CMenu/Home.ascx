<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    var listItem2 = ViewBag.Data2 as List<SysPageEntity>;
    var listItem3 = ViewBag.Data3 as List<SysPageEntity>;

    var page = ViewBag.Page as SysPageEntity;
    var page2 = ViewBag.Page2 as SysPageEntity;
    var page3 = ViewBag.Page3 as SysPageEntity;
%>

<div class="grid12 fl">
    <div class="pnx-container fl">
        <ul class="menu_list fl">
            <li><a href="javascript:void(0);" id="<%=VSWID %>-tab-1" onclick="changeTab('1', '<%=VSWID %>-div-', '<%=VSWID %>-tab-', '3', '', 'active03'); return false;"><%=page.Name %></a></li>
            <li><a href="javascript:void(0);" id="<%=VSWID %>-tab-2" onclick="changeTab('2', '<%=VSWID %>-div-', '<%=VSWID %>-tab-', '3', '', 'active03'); return false;"><%=page2.Name %></a></li>
            <li><a href="javascript:void(0);" id="<%=VSWID %>-tab-3" onclick="changeTab('3', '<%=VSWID %>-div-', '<%=VSWID %>-tab-', '3', '', 'active03'); return false;"><%=page3.Name %></a></li>
        </ul>

        <div class="ui-tabs-panel fl" id="<%=VSWID%>-div-1">
            <div class="col02 fl">
                <ul class="list_col">

                    <%for (int i = 0; listItem != null && listItem.Count > 1 && i < listItem.Count - 1; i++){
                          var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
                    %>
                    <li <%if(i % 2 == 0) {%>class="last"<%} %>><a href="javascript:void(0);"><%=listItem[i].Name %></a>
                        <ul class="list_small">
                            <%for (int j = 0; listChildItem != null && j < listChildItem.Count; j++){%>
                            <li><a href="<%=ViewPage.GetPageURL(listChildItem[j]) %>"><%=listChildItem[j].Name %></a></li>
                            <%} %>
                        </ul>
                    </li>
                    <%} %>
                </ul>
            </div>

            <%if (listItem != null && listItem.Count > 1) {%>
            <div class="col01 fl">
                <div class="list_col">
                    <a href="javascript:void(0);"><%=listItem[listItem.Count - 1].Name %></a>
                    <p class="img fl">
                        <a href="<%=ViewPage.GetPageURL(listItem[listItem.Count - 1]) %>" class="grey_cta">
                            <img src="<%=Utils.GetResizeFile(listItem[listItem.Count - 1].File, 2, 215, 0) %>" width="215" alt="<%=listItem[listItem.Count - 1].Name %>" />
                        </a>
                    </p>
                    <h4 class="subtitle"><%=listItem[listItem.Count - 1].Name %></h4>
                    <p class="detail_mst"><%=listItem[listItem.Count - 1].Summary %></p>
                    <a href="<%=ViewPage.GetPageURL(listItem[listItem.Count - 1]) %>" class="grey_cta">Xem chi tiết...</a>
                </div>
            </div>
            <%} %>
        </div>

        <div class="ui-tabs-panel fl" id="<%=VSWID%>-div-2">
            <div class="col02 fl">
                <ul class="list_col">

                    <%for (int i = 0; listItem2 != null && listItem2.Count > 1 && i < listItem2.Count - 1; i++){
                          var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem2[i].ID);
                    %>
                    <li <%if(i % 2 == 0) {%>class="last"<%} %>><a href="javascript:void(0);"><%=listItem2[i].Name %></a>
                        <ul class="list_small">
                            <%for (int j = 0; listChildItem != null && j < listChildItem.Count; j++){%>
                            <li><a href="<%=ViewPage.GetPageURL(listChildItem[j]) %>"><%=listChildItem[j].Name %></a></li>
                            <%} %>
                        </ul>
                    </li>
                    <%} %>
                </ul>
            </div>

            <%if (listItem2 != null && listItem2.Count > 1) {%>
            <div class="col01 fl">
                <div class="list_col">
                    <a href="javascript:void(0);"><%=listItem2[listItem2.Count - 1].Name %></a>
                    <p class="img fl">
                        <a href="<%=ViewPage.GetPageURL(listItem2[listItem2.Count - 1]) %>" class="grey_cta">
                            <img src="<%=Utils.GetResizeFile(listItem2[listItem2.Count - 1].File, 2, 215, 0) %>" width="215" alt="<%=listItem2[listItem2.Count - 1].Name %>" />
                        </a>
                    </p>
                    <h4 class="subtitle"><%=listItem2[listItem2.Count - 1].Name %></h4>
                    <p class="detail_mst"><%=listItem2[listItem2.Count - 1].Summary %></p>
                    <a href="<%=ViewPage.GetPageURL(listItem2[listItem2.Count - 1]) %>" class="grey_cta">Xem chi tiết...</a>
                </div>
            </div>
            <%} %>
        </div>

        <div class="ui-tabs-panel fl" id="<%=VSWID%>-div-3">
            <div class="col02 fl">
                <ul class="list_col">

                    <%for (int i = 0; listItem3 != null && listItem3.Count > 1 && i < listItem3.Count - 1; i++){
                          var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem3[i].ID);
                    %>
                    <li <%if(i % 2 == 0) {%>class="last"<%} %>><a href="javascript:void(0);"><%=listItem3[i].Name %></a>
                        <ul class="list_small">
                            <%for (int j = 0; listChildItem != null && j < listChildItem.Count; j++){%>
                            <li><a href="<%=ViewPage.GetPageURL(listChildItem[j]) %>"><%=listChildItem[j].Name %></a></li>
                            <%} %>
                        </ul>
                    </li>
                    <%} %>
                </ul>
            </div>

            <%if (listItem3 != null && listItem3.Count > 1) {%>
            <div class="col01 fl">
                <div class="list_col">
                    <a href="javascript:void(0);"><%=listItem3[listItem3.Count - 1].Name %></a>
                    <p class="img fl">
                        <a href="<%=ViewPage.GetPageURL(listItem3[listItem3.Count - 1]) %>" class="grey_cta">
                            <img src="<%=Utils.GetResizeFile(listItem3[listItem3.Count - 1].File, 2, 215, 0) %>" width="215" alt="<%=listItem3[listItem3.Count - 1].Name %>" />
                        </a>
                    </p>
                    <h4 class="subtitle"><%=listItem3[listItem3.Count - 1].Name %></h4>
                    <p class="detail_mst"><%=listItem3[listItem3.Count - 1].Summary %></p>
                    <a href="<%=ViewPage.GetPageURL(listItem3[listItem3.Count - 1]) %>" class="grey_cta">Xem chi tiết...</a>
                </div>
            </div>
            <%} %>
        </div>
    </div>
</div>

<script type="text/javascript">
    changeTab('1', '<%=VSWID %>-div-', '<%=VSWID %>-tab-', '3', '', 'active03');
</script>