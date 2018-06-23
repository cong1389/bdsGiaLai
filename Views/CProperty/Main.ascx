<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    if (ViewPage.CurrentVQS.EndCode.ToLower() == "san-pham") return;
    var listItem = ViewBag.Data as Dictionary<WebMenuEntity, List<WebMenuEntity>>;
%>

<script runat="server">

    public string getAddAtr(int property_id)
    {
        int[] arrPropertyID = ViewBag.arrPropertyID;
        
        if (arrPropertyID == null)
            return ViewPage.CurrentURL  + "?atr=" + property_id;

        List<int> listID = new List<int>();
        listID.AddRange(arrPropertyID);

        if (!listID.Contains(property_id))
            listID.Add(property_id);

        return ViewPage.CurrentURL  + "?atr=" + string.Join("-", listID.ToArray());
    }

    public string getRemoveAtr(int property_id)
    {
        int[] arrPropertyID = ViewBag.arrPropertyID;
        
        List<int> listID = new List<int>();
        listID.AddRange(arrPropertyID);

        if (listID.Contains(property_id))
            listID.Remove(property_id);

        if (listID.Count == 0)
            return ViewPage.CurrentURL  + "?keyword=";

        return ViewPage.CurrentURL  + "?atr=" + string.Join("-", listID.ToArray());
    }
</script>

<%foreach (WebMenuEntity item in listItem.Keys){
    int[] arrPropertyID = ViewBag.arrPropertyID;
    List<WebMenuEntity> list = listItem[item];
%>
<div class="fiter02 fl">
    <h5><%=item.Name%></h5>
    <ul class="list_filter0200">

        <%for (int i = 0; list != null && i < list.Count; i++){%>

        <%if (arrPropertyID != null && Array.IndexOf(arrPropertyID, list[i].ID) > -1){%>
        <li><a href="<%=getRemoveAtr(list[i].ID) %>" class="active"><%=list[i].Name%></a><span style="margin-left:10px;">(<%=list[i].Property_Count%>)</span><a href="<%=getRemoveAtr(list[i].ID) %>"><img src="/Content/img/icon_delete.png" alt="icon_delete" style="vertical-align:middle;cursor:pointer;margin-left:10px;" title="Xóa thuộc tính" /></a></li>
        <%}else {%>
        <li><a href="<%=getAddAtr(list[i].ID) %>"><%=list[i].Name%><span style="margin-left:10px;">(<%=list[i].Property_Count%>)</span></a></li>
        <%} %>

        <%} %>

    </ul>
</div>
<%} %>