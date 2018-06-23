<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as ModProjectModel;
    var listItem = ViewBag.Data as List<ModProjectEntity>;
 %>

<form id="vswForm" name="vswForm" method="post">

<input type="hidden" id="_vsw_action" name="_vsw_action" />
<input type="hidden" id="boxchecked" name="boxchecked" value="0" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetDefaultListCommand()%>
        </div>
        <div class="pagetitle icon-48-article">
            <h2>Dự án</h2> 
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"> <div class="b"></div></div></div>
</div>
<div class="clr"></div>

<script type="text/javascript">

    var VSWController = 'ModProject';

    var VSWArrVar = [
                    'filter_menu', 'MenuID',
                    'filter_city', 'CityID',
                    'filter_district', 'DistrictID',
                    'filter_state', 'State',
                    'filter_lang', 'LangID',
                    'limit', 'PageSize'
                   ];

    var VSWArrVar_QS = [
                        'filter_search', 'SearchText'
                      ];

    var VSWArrQT = [
                    '<%= model.PageIndex + 1 %>', 'PageIndex',
                    '<%= model.Sort %>', 'Sort'
                  ];

    var VSWArrDefault =
                  [
                    '1', 'PageIndex',
                    '1', 'LangID',
                    '20', 'PageSize'
                  ];
</script>
        
<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
             
         <table>
            <tr>
                <td width="100%">
                     Lọc: <input type="text" value="<%= model.SearchText %>" id="filter_search" class="text_area" onchange="VSWRedirect();return false;" />
                    <button onclick="VSWRedirect();return false;">Tìm kiếm</button>
                </td>
                <td nowrap="nowrap">
                    <select id="filter_menu" onchange="VSWRedirect()" class="inputbox" size="1">
                         <option value="0">(Chuyên mục)</option>
                         <%= Utils.ShowDDLMenuByType2("Project", model.LangID, model.MenuID)%>
                    </select>
                    <select id="filter_city" onchange="city_change(this.value); VSWRedirect()" class="inputbox" size="1">
                         <option value="0">(Tỉnh thành)</option>
                         <%= Utils.ShowDDLMenuByType2("City", model.LangID, model.CityID)%>
                    </select>
                    <span id="list_district">
                        <select id="filter_district" onchange="VSWRedirect()" class="inputbox" size="1">
                             <option value="0">(Quận huyện)</option>
                        </select>
                    </span>
                   Vị trí :
                   <select id="filter_state" onchange="VSWRedirect()" class="inputbox" size="1">
                         <option value="0">(Tất cả)</option>
                         <%= Utils.ShowDDLByConfigkey("Mod.ProjectState", model.State)%>
                    </select>
                   Ngôn ngữ :<%= ShowDDLLang(model.LangID)%>
                </td>
            </tr>
        </table>

        <table class="adminlist" cellspacing="1">
            <thead>
                <tr>
                    <th width="1%">
                        #
                    </th>
                    <th width="1%">
                        <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                    </th>
                    <th class="title">
                        <%= GetSortLink("Tiêu đề", "Name")%>
                    </th>
                    <th style="width:40px" nowrap="nowrap">
                        <%= GetSortLink("Ảnh", "File")%>
                    </th>
                    <th nowrap="nowrap">
                        <%= GetSortLink("Chuyên mục", "MenuID")%>
                    </th>
                    <th nowrap="nowrap">
                        <%= GetSortLink("Tỉnh thành", "CityID")%>
                    </th>
                    <th nowrap="nowrap">
                        <%= GetSortLink("Quận huyện", "DistrictID")%>
                    </th>
                    <th nowrap="nowrap">
                        <%= GetSortLink("Diện tích", "Square")%>
                    </th>
                    <th style="width:150px" nowrap="nowrap">
                        <%= GetSortLink("Ngày đăng", "Created")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Duyệt", "Activity")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                         <%= GetSortLink("Sắp xếp", "Order")%>
                        <a href="javascript:vsw_exec_cmd('saveorder')" class="saveorder" title="Lưu sắp xếp"></a>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("ID", "ID")%>
                    </th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td colspan="15">
                        <del class="container">
                            <%= GetPagination(model.PageIndex, model.PageSize, model.TotalRecord)%>
                        </del>
                    </td>
                </tr>
            </tfoot>
            <tbody>
               <%for (int i = 0; listItem != null && i < listItem.Count; i++)
                 { %>
                <tr class="row<%= i%2 %>">
                    <td align="center">
                        <%= i + 1%>
                    </td>
                    <td align="center">
                        <%= GetCheckbox(listItem[i].ID, i)%>
                    </td>
                    <td>
                        <a href="javascript:VSWRedirect('Add', <%= listItem[i].ID %>)"><%= listItem[i].Name%></a>
                        <p class="smallsub">(<span>Mã</span>: <%= listItem[i].Code%>)</p>
                    </td>
                    <td align="center">
                       <%= Utils.GetMedia(listItem[i].File, 40, 40)%>
                    </td>
                    <td align="center">
                       <%= GetName(listItem[i].getMenu()) %>
                    </td>
                    <td align="center">
                       <%= GetName(listItem[i].getCity()) %>
                    </td>
                    <td align="center">
                       <%= GetName(listItem[i].getDistrict()) %>
                    </td>
                    <td align="center">
                       <%= listItem[i].Square %>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:dd-MM-yyyy HH:mm}", listItem[i].Created) %>
                    </td>
                    <td align="center">
                       <%= GetPublish(listItem[i].ID, listItem[i].Activity)%>
                    </td>
                    <td class="order">
                        <%= GetOrder(listItem[i].ID, listItem[i].Order)%>
                    </td>
                    <td align="center">
                       <%= listItem[i].ID%>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
                            
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

<script type="text/javascript">
    function city_change(city_id) {
        var ranNum = Math.floor(Math.random() * 999999);
        sLink = '/{CPPath}/Ajax/GetDistrictByCity.aspx/CityID/' + city_id + '/SelectedID/<%=model.DistrictID%>?rnd=' + ranNum;
        AjaxRequest.get(
	        {
	            'url': sLink
	        , 'onSuccess': function (req) {
	            with (req.responseXML.getElementsByTagName('Item').item(0)) {
	                //var js = getNodeValue(getElementsByTagName('JS'));
	                var content = getNodeValue(getElementsByTagName('Html'));

	                document.getElementById("list_district").innerHTML ='<select id="filter_district" onchange="VSWRedirect()" class="inputbox" size="1"><option value="0">(Quận huyện)</option>' + content + '</select>';

	                //if (js != '')
	                //    eval(js);
	            }
	        }
	        , 'onError': function (req) { }
	        }
        )
    }

    if(<%=model.CityID%> > 0) city_change('<%=model.CityID%>');
    else if(document.getElementById('filter_city').value > 0) city_change(document.getElementById('filter_city').value);

</script>

</form>