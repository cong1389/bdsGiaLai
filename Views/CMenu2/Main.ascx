<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<script runat="server">
    void GetParentPage()
    {
        var page1 = SysPageService.Instance.GetByID_Cache(_page.ParentID);

        if (page1 == null || page1.Root)
            return;

        _page = page1;

        GetParentPage();
    }

    List<SysPageEntity> listItem = null;
    SysPageEntity _page;
    bool root = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        _page = ViewBag.Page;
        if (_page == null)
        {
            _page = (SysPageEntity)ViewPage.CurrentPage.Clone();
            GetParentPage();
        }
        listItem = SysPageService.Instance.GetByParent_Cache(_page.ID);

        string[] ArrCode = { "default", "trang-chu", "home" };
        root = Array.IndexOf(ArrCode, ViewPage.CurrentPage.Code.ToLower()) > -1;
    }
    

</script>
<%  var page = ViewBag.Page as SysPageEntity;
    if (page == null) return; %>
<li class="menu-pc">
    <a href="Javascript:Void(0)" class="menu-pc-title"><%=page.Name %></a>
    <ul class="menu-verti <%=(root == true ? "menu-verti-active" : "") %>">

        <%for (int i = 0; listItem != null && i < listItem.Count; i++)
          {
              var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
        %>
        <li class="menu-verti-i-0"><span class="icon">
            <img src="<%=listItem[i].Icon %>"></span>
            <a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %></a>

            <%if (listChildItem != null)
              {%>
            <ul class="sub-menu">
                <%for (int j = 0; listChildItem != null && j < listChildItem.Count; j++)
                  {
                      var listGrandItem = SysPageService.Instance.GetByParent_Cache(listChildItem[j].ID);
                %>

                <li class="item-step">
                    <a href="<%=ViewPage.GetPageURL(listChildItem[j]) %>" class="a-item-step"><%=listChildItem[j].Name %></a>

                    <%if (listGrandItem != null)
                      {%>
                    <ul class="sub-menu-2">

                        <%for (int k = 0; k < listGrandItem.Count; k++)
                          {%>
                        <li class="all"><a href="<%=ViewPage.GetPageURL(listGrandItem[k]) %>"><%=listGrandItem[k].Name %></a></li>
                        <%} %>
                    </ul>
                    <%} %>
                </li>
                <%} %>
            </ul>
            <%} %>


        </li>

        <%} %>
    </ul>
</li>
