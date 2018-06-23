<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as SysPageModel;
    var entity = ViewBag.Data as SysPageEntity;
    var listMenu = WebMenuService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.ParentID == 0)
                            .Select(o => o.Type)
                            .ToList_Cache();
 %>

<form id="vswForm" name="vswForm" method="post">

<input type="hidden" id="_vsw_action" name="_vsw_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetListCommand("config|Xóa cache,space,post|Lưu,space,cancel|Đóng")%>
        </div>
         <div class="pagetitle icon-48-langmanager">
            <h2>Trang : Thêm nhiều</h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<div class="clr"></div>

<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="col width-100">
          <table class="admintable">
            <tr>
                <td class="key">
                    <label>Loại dữ liệu :</label>
                </td>
                <td>
                    <select class="text_input" name="PageType">
                       <option value=''></option>
                        <%for (int i = 0; listMenu != null && i < listMenu.Count;i++ ) {%>
                        <option value='<%=listMenu[i].Type %>'><%=listMenu[i].Type %></option>
                        <%} %>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Danh sách trang :</label>
                </td>
                <td>
                    <textarea class="text_input" style="height:200px;width:98%" name="ListPage"></textarea>
                </td>
            </tr>
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>