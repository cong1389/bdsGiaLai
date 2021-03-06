﻿<%@ Control Language="C#" AutoEventWireup="true"%>

<script runat="server">
    public VSW.Core.Global.Class CurrentObject { get; set; }
    public SysPageEntity CurrentPage { get; set; }
    public VSW.Lib.MVC.ModuleInfo CurrentModule { get; set; }
    public int LangID { get; set; }
</script>

<div class="col width-100">
  <table class="admintable">
     <%for (int i = 0; CurrentObject != null && i < CurrentObject.GetFields_Name().Length; i++)
        {
            string fieldName = CurrentObject.GetFields_Name()[i];

            System.Reflection.FieldInfo _FieldInfo = CurrentObject.GetFieldInfo(fieldName);
            object[] attributes = _FieldInfo.GetCustomAttributes(typeof(VSW.Core.MVC.PropertyInfo), true);
            if (attributes == null || attributes.GetLength(0) == 0)
                continue;

            VSW.Core.MVC.PropertyInfo propertyInfo = (VSW.Core.MVC.PropertyInfo)attributes[0];

            string currentID = CurrentModule.Code + "_" + fieldName;
            string currentValue = string.Empty;

            if (CurrentPage != null)
                currentValue = CurrentPage.Items.GetValue(CurrentModule.Code + "." + fieldName).ToString();

            if (currentValue == string.Empty)
                currentValue = (CurrentObject.GetField(fieldName) == null ? string.Empty : CurrentObject.GetField(fieldName).ToString());

            List<VSW.Lib.Global.ListItem.Item> _List = null;
           
            if (propertyInfo.Value is string)
                _List = VSW.Lib.Global.ListItem.List.GetListByText(propertyInfo.Value.ToString());

            if (_List != null && VSW.Lib.Global.ListItem.List.FindByName(_List, "ConfigKey").Value != string.Empty)
            {
                _List = VSW.Lib.Global.ListItem.List.GetListByText("," + VSW.Core.Global.Config.GetValue(VSW.Lib.Global.ListItem.List.FindByName(_List, "ConfigKey").Value).ToString());
            }

            if (fieldName.IndexOf("ViewLayoutByUser") > -1)
            {
                _List = new List<VSW.Lib.Global.ListItem.Item>();
                _List.Insert(0, new VSW.Lib.Global.ListItem.Item("Dạng danh mục", "Cate"));
            }

            if (fieldName.IndexOf("PageID") > -1)
            {
                _List = VSW.Lib.Global.ListItem.List.GetList(SysPageService.Instance);
                _List.Insert(0, new VSW.Lib.Global.ListItem.Item(string.Empty, string.Empty));
            }

            if (fieldName.IndexOf("MenuID") > -1)
            {
                bool HasContinue = false;
                string menuType = string.Empty;
                if (_List != null)
                {
                    menuType = VSW.Lib.Global.ListItem.List.FindByName(_List, "Type").Value;
                    HasContinue = !VSW.Core.Global.Convert.ToBool(VSW.Lib.Global.ListItem.List.FindByName(_List, "Show").Value);
                }

                if (HasContinue)
                    continue;
                else
                {
                    _List = VSW.Lib.Global.ListItem.List.GetList(WebMenuService.Instance, LangID, menuType);
                    _List.Insert(0, new VSW.Lib.Global.ListItem.Item(string.Empty, string.Empty));
                }
            } %>

            <tr id='tr_<%= currentID %>'>
               <td class="key"><%= propertyInfo.Key %> :</td>
               <td>

                   <%if (_List != null)
                    {%>
                        <select id="<%= currentID %>" name="<%= currentID %>" style="width:80%;" class="text_input" />
                            <%for (int j = 0; j < _List.Count; j++)
                            {%>
                                <option <%=(currentValue == _List[j].Value ? "selected" : "") %> value='<%= _List[j].Value%>'><%= _List[j].Name %></option>
                            <%}%>
                        </select>
                    <%}
                    else
                    {%>
                        <input id="<%= currentID %>" name="<%= currentID %>" type="text" class="text_input" style="width:80%;" value="<%= currentValue %>" />

                        <%if (fieldName.StartsWith("NewsID")){%>
                            &nbsp;<input type="image" class="vsw-icon" onclick="ShowNewsForm('<%= currentID %>',<%= currentValue %>);return false;" src="/{CPPath}/Content/add/img/search-16.gif"/>
                        <%}else if (fieldName.StartsWith("Text")){
                              VSW.Lib.Global.Session.SetValue(currentID, currentValue);
                              %>
                            &nbsp;<input type="image" class="vsw-icon" onclick="ShowTextForm('<%= currentID %>','<%= currentValue %>');return false;" src="/{CPPath}/Content/add/img/search-16.gif" />
                        <%}else if (fieldName.StartsWith("File")){%>
                            &nbsp;<input type="image" class="vsw-icon" onclick="ShowFileForm('<%= currentID %>','<%= currentValue %>');return false;" src="/{CPPath}/Content/add/img/search-16.gif"  />
                        <%}%>

                    <%}%>

                   <input type="image" class="vsw-icon" onclick="UpdateCustom('<%= currentID %>','');return false;" src="/{CPPath}/Content/add/img/save-16.gif" />
              </td>
          </tr>
      <%} %>
  </table>
</div>