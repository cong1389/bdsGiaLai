<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    
    List<ModAdvEntity> listItem = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";

        int page = VSW.Core.Web.HttpQueryString.GetValue("page").ToInt(0);
        int menuId = VSW.Core.Web.HttpQueryString.GetValue("menu_id").ToInt(0);

        listItem = ModAdvService.Instance.CreateQuery()
            .Where(o => o.Activity == true)
            .Where(o => o.MenuID == menuId)
            .Take(6)
            .Skip(page * 6)
            .ToList();
    }
    
</script>
<playlist version="1" xmlns="http://xspf.org/ns/0/">
    <trackList>
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
        <Item>
            <URL><%=listItem[i].URL%></URL>
            <File><%=listItem[i].File.Replace("~/", "/")%></File>
        </Item>
    <%}%>
    </trackList>
</playlist>
