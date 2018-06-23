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

<div class="tintuc_col fl magin_top">
    <h2>Lọc tìm</h2>
    <ul class="list_filter">
        
        <%foreach (WebMenuEntity item in listItem.Keys){
            int[] arrPropertyID = ViewBag.arrPropertyID;
            List<WebMenuEntity> list = listItem[item];
        %>
        <li><a href="javascript:void(0);"><%=item.Name%></a>
            <div class="list_filter02">
                <%for (int i = 0; list != null && i < list.Count; i++){%>

                <%if (arrPropertyID != null && Array.IndexOf(arrPropertyID, list[i].ID) > -1){%>
                <p><input type="checkbox" checked="checked" name="<%=VSWID %>_<%=item.ID %>" onclick="location.href='<%=getRemoveAtr(list[i].ID) %>';" /><a href="<%=getRemoveAtr(list[i].ID) %>" class="active"><%=list[i].Name%><img src="/Content/img/icon_delete.png" alt="icon_delete" style="vertical-align:middle;cursor:pointer;margin-left:10px;" title="Xóa thuộc tính" /></a></p>
                <%}else {%>
                <p><input type="checkbox" name="<%=VSWID %>_<%=item.ID %>" onclick="location.href='<%=getAddAtr(list[i].ID) %>';" /><a href="<%=getAddAtr(list[i].ID) %>"><%=list[i].Name%></a></p>
                <%} %>

                <%} %>
            </div>
        </li>
        <%} %>
    </ul>
</div>