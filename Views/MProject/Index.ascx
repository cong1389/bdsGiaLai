<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>



<script runat="server">
    MProjectModel model;
    int ProjectID = -1, MenuID = -1, CityID, DistrictID;
    List<WebMenuEntity> listCity = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        var item = ViewPage.ViewBag.Data as ModProjectEntity;
        if (item != null)
        {
            MenuID = item.MenuID;
            CityID = item.CityID;
            DistrictID = item.DistrictID;

        }
        model = ViewBag.Model;
        listCity = GetByType("Project");
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
    var listItem = ViewBag.Data as List<ModProjectEntity>;
    var model = ViewBag.Model as MProjectModel;
%>

<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.MenuID, ViewPage.CurrentPage.Code) %>" class="a-title"><%=ViewPage.CurrentPage.Name %> </a></h2>
        </div>
    </div>
    <div class="bds-body">
        <ul class="list_tintuc">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++)
              {
                  string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
            %>
            <li>
                <a href="<%=url %>">
                    <img src="<%=Utils.GetResizeFile(listItem[i].File, 2, 160, 120)%>" width="160" height="120" alt="<%=listItem[i].Name%>" />
                </a>
                <a href="<%=url %>"><%= listItem[i].Name %></a>
                <p class="name2">
                    <a href="<%=url %>"><%= listItem[i].Summary %></a>
                </p>
                <span class="timeNew"><%=string.Format("{0:dd/MM/yyyy}", listItem[i].Created) %></span>
            </li>
            <%} %>
        </ul>
        <ul class="phantrang">
            <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
        </ul>
    </div>
</div>
