<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<script runat="server">
    List<WebMenuEntity> listType = null, listMenu = null, listCity = null, listProject = null, listPrice = null, listSquare = null;
    int TypeID = -1, MenuID = -1, CityID = -1, DistrictID = -1, StreetID = -1, ProjectID = -1, PriceID = 0, SquareID = 0;
    
    string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        listType = GetByType("Type");
        listMenu = GetByType("BSNews");
        listCity = GetByType("City");
        listProject = GetByType("Project");
        listPrice = GetByType("Price");
        listSquare = GetByType("Square");

        var item = ViewPage.ViewBag.Data as ModBSNewsEntity;
        if (item != null)
        {
            MenuID = item.MenuID;
            TypeID = item.TypeID;
            CityID = item.CityID;
            DistrictID = item.DistrictID;
            StreetID = item.StreetID;
            ProjectID = item.ProjectID;
            PriceID = item.PriceInt;
            SquareID = item.SquareInt;
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
                else if (indexVSQ.IndexOf('j') > -1) ProjectID = value;
                else if (indexVSQ.IndexOf('p') > -1) PriceID = value;
                else if (indexVSQ.IndexOf('q') > -1) SquareID = value;

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
<div class="box-timkiem all">
    <div class="in-tab">
        <p class="icon_tk">Tìm kiếm </p>

        <form onsubmit="doSearch(); return false;">


            <p>
                <input type="text" name="keyword" id="keyword" onblur="onTextBlur('keyword','{RS:Web_SearchText}');" onfocus="onTextFocus('keyword','{RS:Web_SearchText}');" value="{RS:Web_SearchText}" /></td>
            </p>
            <p >
                <select id="menu_id" onchange="menu_change(this.value); return false;">
                    <option value="0">Chuyên mục</option>
                    <%for (int i = 0; listMenu != null && i < listMenu.Count; i++)
                      {%>
                    <option value="<%=listMenu[i].ID %>" <%if (listMenu[i].ID == MenuID)
                                                           {%>selected<%} %>><%=listMenu[i].Name %></option>
                    <%} %>
                </select>
            </p>

            <p id="listtype_id">
                <select id="type_id">
                    <option value="0">Danh Mục</option>
                </select>
            </p>


            <p>
                <select id="city_id" onchange="city_change(this.value); return false;">
                    <option value="0">Tỉnh thành</option>
                    <%for (int i = 0; listCity != null && i < listCity.Count; i++)
                      {%>
                    <option value="<%=listCity[i].ID %>" <%if (listCity[i].ID == CityID)
                                                           {%>selected<%} %>><%=listCity[i].Name %></option>
                    <%} %>
                </select>

            </p>

            <p id="list_district">
                <select id="district_id">
                    <option value="0">Quận huyện</option>
                </select>
            </p>
            <p  id="list_street">
                        <select id="street_id" >
                            <option value="0">Phường Xã</option>
                        </select>
             </p>
            <p id="list_Project">
                <select id="project_id">
                    <option value="0">Dự Án</option>
                </select>
            </p>
            <p>
                <select id="price_id">
                    <option value="0">Khoảng giá</option>
                    <%for (int i = 0; listPrice != null && i < listPrice.Count; i++)
                      {%>
                    <option value="<%=listPrice[i].ID %>" <%if (listPrice[i].ID == PriceID)
                                                           {%>selected<%} %>><%=listPrice[i].Name %></option>
                    <%} %>
                </select>
            </p>
            <p>
                <select id="square_id">
                    <option value="0">Diện tích</option>
                      <%for (int i = 0; listSquare != null && i < listSquare.Count; i++)
                      {%>
                    <option value="<%=listSquare[i].ID %>" <%if (listSquare[i].ID == SquareID)
                                                           {%>selected<%} %>><%=listSquare[i].Name %></option>
                    <%} %>
                </select>
            </p>

            <p><a class="ip-btl-search-1" href="javascript:void(0)" onclick="doSearch(); return false;">Tìm kiếm</a></p>
        </form>
    </div>
</div>
<%-- ------------------------------------------------------------ --%>
<script type="text/javascript">
    function doSearch() {
        var keyword = document.getElementById('keyword');
        var type_id = document.getElementById('menu_id');
        var menu_id = document.getElementById('type_id');
        var city_id = document.getElementById('city_id');
        var district_id = document.getElementById('district_id');
        var street_id = document.getElementById('street_id');
        var project_id = document.getElementById('project_id');
        var price_id = document.getElementById('price_id');
        var square_id = document.getElementById('square_id');


        var sURL = '/rao-vat/';

        if (type_id.value < 1 && menu_id.value < 1 && city_id.value < 1 && district_id.value < 1 && street_id.value < 1 && project_id.value < 1 && price_id.value < 1 && square_id.value < 1 && price_id.value < 1 && square_id.value < 1) sURL = '/rao-vat.html';

        if (type_id.value > 0) sURL += 't' + type_id.value + '/';
        if (menu_id.value > 0) sURL += 'm' + menu_id.value + '/';
        if (city_id.value > 0) sURL += 'c' + city_id.value + '/';
        if (district_id.value > 0) sURL += 'd' + district_id.value + '/';
        if (street_id.value > 0) sURL += 's' + street_id.value + '/';
        if (project_id.value > 0) sURL += 'j' + project_id.value + '/';
        if (price_id.value > 0) sURL += 'p' + price_id.value + '/';
        if (square_id.value > 0) sURL += 'q' + square_id.value + '/';


        if (district_id.value > 0) sURL += remove_unicode(district_id.options[district_id.selectedIndex].text) + '.html';
        else if (city_id.value > 0) sURL += remove_unicode(city_id.options[city_id.selectedIndex].text) + '.html';
        else if (street_id.value > 0) sURL += remove_unicode(street_id.options[street_id.selectedIndex].text) + '.html';
        else if (menu_id.value > 0) sURL += remove_unicode(menu_id.options[menu_id.selectedIndex].text) + '.html';
        else if (type_id.value > 0) sURL += remove_unicode(type_id.options[type_id.selectedIndex].text) + '.html';
        else if (project_id.value > 0) sURL += remove_unicode(project_id.options[project_id.selectedIndex].text) + '.html';
        else if (price_id.value > 0) sURL += remove_unicode(price_id.options[price_id.selectedIndex].text) + '.html';
        else if (square_id.value > 0) sURL += remove_unicode(square_id.options[square_id.selectedIndex].text) + '.html';

        if (keyword.value != '{RS:Web_SearchText}') {
            if (keyword.value.length > 0 && keyword.value.length < 2) {
                alertZebra('Từ khóa phải nhiều hơn 1 ký tự.', 'Thông báo');
                return;
            }
            else sURL += '?keyword=' + keyword.value;
        }

        window.location.href = sURL;
    }


    function city_change(city_id) {
        if (city_id > 0) {
            document.getElementById("list_street").innerHTML = '<select id="street_id" " ><option value="0">Chọn Phường / xã</option></select>';
            document.getElementById("list_district").innerHTML = '<select id="district_id"  ><option value="0">Chọn Quận / huyện</option></select>';
            var ranNum = Math.floor(Math.random() * 999999);
            sLink = '/Tools/GetHTML.aspx?cmd=get_chid_menu&parent_id=' + city_id + '&select_id=<%=DistrictID%>&rnd=' + ranNum;
        AjaxRequest.get(
	        {
	            'url': sLink
                , 'onSuccess': function (req) {
                    with (req.responseXML.getElementsByTagName('I').item(0)) {
                        var content = getNodeValue(getElementsByTagName('ListMenu'));
                        document.getElementById("list_district").innerHTML = '<select id="district_id"  onchange="city_change2(this.value);city_change_project(this.value); return false;"><option value="0" >Chọn quận / huyện</option>' + content + '</select>';
                    }
                }
	            , 'onError': function (req) { }
	        }
        )
    } else {
        document.getElementById("list_district").innerHTML = '<select id="district_id"  ><option value="0">Chọn Quận / huyện</option></select>';
        document.getElementById("list_street").innerHTML = '<select id="street_id" ><option value="0">Chọn Phường / xã</option></select>';
    }
}
function city_change2(district_id) {
    if (district_id > 0) {
        var ranNum = Math.floor(Math.random() * 999999);
        sLink = '/Tools/GetHTML.aspx?cmd=get_chid_menu&parent_id=' + district_id + '&select_id=<%=StreetID%>&rnd=' + ranNum;
            AjaxRequest.get(
                {
                    'url': sLink
                    , 'onSuccess': function (req) {
                        with (req.responseXML.getElementsByTagName('I').item(0)) {
                            var content2 = getNodeValue(getElementsByTagName('ListMenu'));
                            document.getElementById("list_street").innerHTML = '<select id="street_id" class="ddl" ><option value="0">Chọn Phường / xã</option>' + content2 + '</select>';
                        }
                    }
                    , 'onError': function (req) { }
                }
            )
        } else {
            document.getElementById("list_street").innerHTML = '<select id="street_id" class="ddl" ><option value="0">Chọn Phường / xã</option></select>';
        }
}

    function menu_change(menu_id) {
        if (menu_id > 0) {
            var ranNum = Math.floor(Math.random() * 999999);
            sLink = '/Tools/GetHTML.aspx?cmd=get_chid_menu&parent_id=' + menu_id + '&select_id=<%=TypeID%>&rnd=' + ranNum;
        AjaxRequest.get(
            {
                'url': sLink
                , 'onSuccess': function (req) {
                    with (req.responseXML.getElementsByTagName('I').item(0)) {
                        var content2 = getNodeValue(getElementsByTagName('ListMenu'));
                        document.getElementById("listtype_id").innerHTML = '<select id="type_id" class="ddl" ><option value="0">Chọn Danh mục</option>' + content2 + '</select>';
                    }
                }
                , 'onError': function (req) { }
            }
        )
    } else {
            document.getElementById("listtype_id").innerHTML = '<select id="listtype_id" class="ddl" ><option value="0">Chọn Danh mục</option></select>';
    }
    }
    function city_change_project(district_id) {
        if (district_id > 0) {
            var ranNum = Math.floor(Math.random() * 999999);
            sLink = '/Tools/GetHTML.aspx?cmd=get_project&District_ID=' + district_id + '&select_id=<%=DistrictID%>&rnd=' + ranNum;
            AjaxRequest.get(
                {
                    'url': sLink
                    , 'onSuccess': function (req) {
                        with (req.responseXML.getElementsByTagName('I').item(0)) {
                            var content3 = getNodeValue(getElementsByTagName('ListMenu'));
                            document.getElementById("list_Project").innerHTML = '<select id="project_id"  ><option value="0">Chọn Dự Án</option>' + content3 + '</select>';
                        }
                    }
                    , 'onError': function (req) { }
                }
            )
        } else {
            document.getElementById("list_Project").innerHTML = '<select id="project_id" ><option value="0">Chọn Dự án</option></select>';
        }
    }
</script>
