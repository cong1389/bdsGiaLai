<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<script runat="server">
    List<WebMenuEntity> listType = null, listPrice = null;
    int TypeID = -1, PriceID = -1;
    string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        listType = GetByType("Type");
        listPrice = GetByType("Price");

        var item = ViewPage.ViewBag.Data as ModBSNewsEntity;
        if (item != null)
        {
            TypeID = item.TypeID;
            PriceID = item.PriceID;
        }
        else
        {
            VSW.Core.Web.VQS qs = ViewPage.CurrentVQS;
            for (int i = 0; i < qs.Count - 1; i++)
            {
                string indexVSQ = qs.GetString(i).ToLower();
                int value = VSW.Core.Global.Convert.ToInt((indexVSQ.Substring(1)));

                if (indexVSQ.IndexOf('t') > -1) TypeID = value;
                else if (indexVSQ.IndexOf('p') > -1) PriceID = value;
            }
        }

        title = ViewBag.Title;
    }

    private List<WebMenuEntity> GetByType(string type)
    {
        var list = WebMenuService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Type == type && o.ParentID == 0)
                            .ToList_Cache();

        if (list == null) return null;

        return WebMenuService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Type == type && o.ParentID == list[0].ID)
                            .OrderByAsc(o => new { o.Order, o.ID })
                            .ToList_Cache();
    }

</script>

<div class="timtheogia">
    <div class="title">
        <p>Tìm theo giá</p>
    </div>

    <%for (int i = 0; listType != null && i < listType.Count; i++){
          var listPriceByOwn = WebMenuService.Instance.CreateQuery()
                                  .Where(o => o.Activity == true && o.Type == "Price")
                                  .Where("[Custom] LIKE '%" + listType[i].Code + "%'")
                                  .OrderByAsc(o => new { o.Order, o.ID })
                                  .ToList_Cache();
    %>
    <p><%=listType[i].Name %></p>
    <ul>
        <%for (int j = 0; listPriceByOwn != null && j < listPriceByOwn.Count; j++){%>
        <li><a href="/rao-vat/t<%=listType[i].ID %>/p<%=listPriceByOwn[j].ID %>/<%=listPriceByOwn[j].Code %>.html"><%=listPriceByOwn[j].Name %></a></li>
        <%} %>
    </ul>
    <%} %>
    
</div>