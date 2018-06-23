<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as Dictionary<WebMenuEntity, List<WebMenuEntity>>;
    //if (ViewPage.CurrentModule.Code != "MProduct" || ViewPage.CurrentModule.Code != "MSearch") return;
    //var model = ViewBag.Model as MProductModel;
%>

<script runat="server">

    public string getAddAtr(int property_id)
    {
        int[] arrPropertyID = ViewBag.arrPropertyID;

        if (arrPropertyID == null)
            return ViewPage.CurrentURL + "?atr=" + property_id;

        List<int> listID = new List<int>();
        listID.AddRange(arrPropertyID);

        if (!listID.Contains(property_id))
            listID.Add(property_id);

        return ViewPage.CurrentURL + "?atr=" + string.Join("-", listID.ToArray());
    }

    public string getRemoveAtr(int property_id)
    {
        int[] arrPropertyID = ViewBag.arrPropertyID;

        List<int> listID = new List<int>();
        listID.AddRange(arrPropertyID);

        if (listID.Contains(property_id))
            listID.Remove(property_id);

        if (listID.Count == 0)
            return ViewPage.CurrentURL + "?state=0";

        return ViewPage.CurrentURL + "?atr=" + string.Join("-", listID.ToArray());
    }
</script>

<%if (listItem.Count > 0)
  {%>


<input type="hidden" name="value" id="value" value="" />
<input type="hidden" name="arrPropertyID" id="arrPropertyID" value="" />
<div class="box-por all">
    <h2 class="title-type"><a href="Javácript:void(0)">Lọc tìm </a></h2>
    <%foreach (var item in listItem.Keys)
      {
          int[] arrPropertyID = ViewBag.arrPropertyID;
          var list = listItem[item];
    %>
    <div class="box-tab-filter">
        <div class="filter_title"><%=item.Name%> </div>
        <%for (int i = 0; list != null && i < list.Count; i++)
          {%>
        <a href="javascript:void(0)" id="<%=Data.GetCode(item.Name) %>+<%=list[i].ID%>" onclick="getvalue('<%=Data.GetCode(item.Name) %>+<%=list[i].ID%>',this,<%=ViewPage.CurrentPage.MenuID %>,<%=ViewPage.CurrentPage.LangID %>)"><%=list[i].Name%> (<b style="color: red"><%=list[i].Property_Count%></b>)</a>
        <%} %>
    </div>
    <%} %>
</div>

<%} %>
