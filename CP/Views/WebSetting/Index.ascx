﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<script runat="server">
   
    WebSettingModel model = null;
    List<WebSettingEntity> listEntity = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        model = ViewBag.Model as WebSettingModel;
        listEntity = ViewBag.Data as List<WebSettingEntity>;
    }
    
</script>

<form id="vswForm" name="vswForm" method="post">

<input type="hidden" id="_vsw_action" name="_vsw_action" />
<input type="hidden" id="boxchecked" name="boxchecked" value="0" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetListCommand("new|Thêm,edit|Sửa,space,publish|Duyệt,unpublish|Bỏ duyệt,space,delete|Xóa")%>
        </div>
        <div class="pagetitle icon-48-user">
            <h2>Cấu hình</h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"> <div class="b"></div></div></div>
</div>
<div class="clr"></div>

<script type="text/javascript">

    var VSWController = 'WebSetting';

    var VSWArrVar = [
                    'filter_lang', 'LangID',
                    'limit', 'PageSize'
                   ];

    var VSWArrVar_QS = [
                        'filter_search', 'SearchText'
                      ];

    var VSWArrQT = [
                    '<%= model.PageIndex %>', 'PageIndex',
                    '<%= model.Sort %>', 'Sort'
                  ];

    var VSWArrDefault =
                  [
                    '1', 'LangID',
                    '20', 'PageSize'
                  ];
</script>
        
<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
                       
        <table>
            <tr>
                <td width="100%">
                    Lọc:
                    <input type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area" onchange="VSWRedirect();return false;" />
                    <button onclick="VSWRedirect();return false;">Tìm kiếm</button>
                </td>
                <td nowrap="nowrap">
                    Ngôn ngữ :<%= ShowDDLLang(model.LangID)%>
                </td>
            </tr>
        </table>                
                        
        <table class="adminlist" cellspacing="1">
            <thead>
                <tr>
                    <th width="1%">
                        #
                    </th>
                    <th width="1%">
                        <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                    </th>
                    <th nowrap="nowrap">
                        <%= GetSortLink("Tên", "Name")%>
                    </th>
                    <th nowrap="nowrap">
                        <%= GetSortLink("Mã", "Code")%>
                    </th>
                    <th nowrap="nowrap">
                       Giá trị
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("ID", "ID")%>
                    </th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td colspan="15">
                        <del class="container">
                            <%= GetPagination(model.PageIndex, model.PageSize, model.TotalRecord)%>
                        </del>
                    </td>
                </tr>
            </tfoot>
            <tbody>
               <%for (int i = 0; listEntity != null && i < listEntity.Count; i++)
                 { %>
                <tr class="row<%= i%2 %>">
                    <td align="center">
                        <%= i + 1%>
                    </td>
                    <td align="center">
                        <%= GetCheckbox(listEntity[i].ID, i)%>
                    </td>
                    <td align="center">
                        <a href="javascript:VSWRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                    </td>
                    <td align="center">
                        <%= listEntity[i].Code%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].Value%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].ID%>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
                            
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>