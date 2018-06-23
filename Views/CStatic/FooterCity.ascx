<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<script runat="server">
    List<WebMenuEntity> listCity = null;
    int CityID = -1;
    string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        listCity = GetByType("City");


        var item = ViewPage.ViewBag.Data as ModBSNewsEntity;
        if (item != null)
        {

            CityID = item.CityID;

        }
        else
        {
            VSW.Core.Web.VQS qs = ViewPage.CurrentVQS;
            for (int i = 0; i < qs.Count - 1; i++)
            {
                string indexVSQ = qs.GetString(i).ToLower();
                int value = VSW.Core.Global.Convert.ToInt((indexVSQ.Substring(1)));
                if (indexVSQ.IndexOf('c') > -1) CityID = value;
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

<% 
    if (listCity == null) return;
%>
<%-- ----------------------------------------------- --%>
<form onsubmit="doSearch1(); return true;">
    <ul class="list_01 fl">
        <li class="private"><a href="javascript:void(0)"  class="nb">Tìm Theo Thành Phố</a></li>
            <%for (int i = 0; listCity != null && i < listCity.Count; i++)
              {%>
    <li><a href="javascript:void(0)" onclick="doSearch1('city_id<%=i%>','<%=listCity[i].ID %>','<%=listCity[i].Name %>'); return true;" class="nb"><%=listCity[i].Name %></a></li>
            <%} %>
        </ul>
</form>
<%-- ------------------------------------------------------------ --%>
<script type="text/javascript">
    function doSearch1(cityid, id, name) {
        var city_id = cityid;
        var sURL = '/rao-vat/';
        if (city_id == null) sURL = '/rao-vat.html';
        if (city_id != null) sURL += 'c' + id + '/';
        if (city_id != 0) sURL += remove_unicode(name) + '.html';
        window.location.href = sURL;
    }
</script>
