<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<script runat="server">
    List<WebMenuEntity> listType = null, listMenu = null, listCity = null;
    int TypeID = -1, MenuID = -1, CityID = -1, DistrictID = -1, StreetID = -1;
    string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        listType = GetByType("Type");
        listMenu = GetByType("BSNews");
        listCity = GetByType("City");


        var item = ViewPage.ViewBag.Data as ModBSNewsEntity;
        if (item != null)
        {
            MenuID = item.MenuID;
            TypeID = item.TypeID;
            CityID = item.CityID;
            DistrictID = item.DistrictID;
            StreetID = item.StreetID;

        }
        else
        {
            VSW.Core.Web.VQS qs = ViewPage.CurrentVQS;
            for (int i = 0; i < qs.Count - 1; i++)
            {
                string indexVSQ = qs.GetString(i).ToLower();
                int value = VSW.Core.Global.Convert.ToInt((indexVSQ.Substring(1)));

                if (indexVSQ.IndexOf('m') > -1) MenuID = value;
                else if (indexVSQ.IndexOf('t') > -1) TypeID = value;
                else if (indexVSQ.IndexOf('c') > -1) CityID = value;
                else if (indexVSQ.IndexOf('d') > -1) DistrictID = value;
                else if (indexVSQ.IndexOf('s') > -1) StreetID = value;
                else MenuID = ViewPage.CurrentPage.MenuID;
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
    if (listMenu == null) return;
%>
<%-- ----------------------------------------------- --%>
<form onsubmit="doSearch1(); return true;">
    <div class="ViewMenu_left fl">
        <div class="fl sl_tinh">
            <span>Tỉnh Thành Nhiều Tin: </span>
        </div>
        <span class="tinh-thanh">

                         <%var x = 4;
                           if (listCity.Count >= 4){x = 4;}else{x = listCity.Count;}
                           for (int i = 0; listCity != null && i < x; i++)
                           {%>
            <a href="javascript:void(0)" class="acity" onclick="doSearch1('city_id<%=i%>','<%=listCity[i].ID %>','<%=listCity[i].Name %>'); return true;" class="nb"><%=listCity[i].Name %></a>&nbsp;|&nbsp;
            <%} %>
        </span>
        <!--  -->
        <script>
            $(function () {
                $('#TM_CityView').click(function () {
                    $('#TM_pnCity').slideToggle('slow');
                });
            });
        </script>
        <!--  -->

        <a class="arrow-down-gray acity" id="TM_CityView">Chọn Tỉnh/Thành</a>
        <div id="TM_pnCity" class="all_city" style="display: none;">
            <p class="menu-select-city">
                <strong class="red3">----CHỌN TỈNH/THÀNH----</strong>
            </p>

            <%for (int i = 0; listCity != null && i < listCity.Count; i++)
              {%><ul class="list_tp01 fl">
                          <li><a href="javascript:void(0)" onclick="doSearch1('city_id<%=i%>','<%=listCity[i].ID %>','<%=listCity[i].Name %>'); return true;" class="nb"><%=listCity[i].Name %></a> </li>
                      </ul>
            <%} %>
        </div>

    </div>
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
