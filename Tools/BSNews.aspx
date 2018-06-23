<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    
    List<ModBSNewsEntity> listItem = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";

        int MenuID = VSW.Core.Web.HttpQueryString.GetValue("menu_id").ToInt(0);
        int State = VSW.Core.Web.HttpQueryString.GetValue("state").ToInt(0);

        int LangID = VSW.Core.Web.HttpQueryString.GetValue("lang_id").ToInt(0);
        int Page = VSW.Core.Web.HttpQueryString.GetValue("page").ToInt(0);
        int PageSize = VSW.Core.Web.HttpQueryString.GetValue("page_size").ToInt(0);

        listItem = ModBSNewsService.Instance.CreateQuery()
                                .Where(o => o.Activity == true)
                                .Where(State > 0, o => (o.State & State) == State)
                                .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BSNews", MenuID, LangID))
                                .Take(PageSize)
                                .Skip(PageSize * Page)
                                .OrderByDesc(o => new { o.Order, o.ID })
                                .ToList();
    }
    
</script>
<playlist version="1" xmlns="http://xspf.org/ns/0/">
    <trackList>
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
        <Item>
            <File><%=Utils.GetResizeFile(listItem[i].File, 2, 140, 140)%></File>
            <Name><%=listItem[i].Name%></Name>
            <Summary><%=listItem[i].Summary%></Summary>
            <Menu><%= listItem[i].getMenu().Name %></Menu>
            <Location><%=listItem[i].getDistrict().Name %> - <%=listItem[i].getCity().Name %></Location>
            <Price><%=listItem[i].TotalPrice %></Price>
            <Created><%= string.Format("{0:dd/MM/yyyy}", listItem[i].Created) %></Created>
        </Item>
    <%}%>
    </trackList>
</playlist>