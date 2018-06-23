<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as SysMenuModel;
    var item = ViewBag.Data as WebMenuEntity;

    var listParent = VSW.Lib.Global.ListItem.List.GetList(WebMenuService.Instance, model.LangID);

    if (model.RecordID > 0)
    {
        //loai bo danh muc con cua danh muc hien tai
        listParent = VSW.Lib.Global.ListItem.List.GetListForEdit(listParent, model.RecordID);
    }
%>

<form id="vswForm" name="vswForm" method="post">

<input type="hidden" id="_vsw_action" name="_vsw_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-categories">
            <h2>Chuyên mục : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Tên chuyên mục :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Name" value="<%=item.Name %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Mã :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Code" value="<%=item.Code %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Mã thiết kế:</label>
                </td>
                <td>
                    <textarea class="text_input" style="height:50px;" name="Custom" id="custom"><%=item.Custom %></textarea>
                </td>
            </tr>
            <%if (model.ParentID == 0)
              { %>
            <tr>
                <td class="key">
                    <label>Loại :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Type" value="<%=item.Type %>" maxlength="50" />
                </td>
            </tr>
            <%} %>

             <tr>
                <td class="key">
                    <label>Chuyên mục cha :</label>
                </td>
                <td>
                    <select class="text_input" name="ParentID">
                         <option value="0">Root</option>
                        <%for (int i = 0; listParent != null && i < listParent.Count; i++)
                          { %>
                            <option <%if(item.ParentID.ToString()==listParent[i].Value) {%>selected<%} %> value='<%= listParent[i].Value%>'>&nbsp; <%= listParent[i].Name%></option>
                        <%} %>   
                    </select>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Duyệt :</label>
                </td>
                <td>
                    <input name="Activity" <%= item.Activity ? "checked" : "" %> type="radio" value='1' /> Có
                    <input name="Activity" <%= !item.Activity ? "checked" : "" %> type="radio" value='0' /> Không
                </td>
            </tr>
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>