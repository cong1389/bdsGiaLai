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
    protected void Page_Load(object sender, EventArgs e)
    {
        _page = ViewBag.Page;
        if (_page == null)
        {
            _page = (SysPageEntity)ViewPage.CurrentPage.Clone();
            GetParentPage();
        }
        listItem = SysPageService.Instance.GetByParent_Cache(_page.ID);
    }

</script>

<% 
    if (listItem == null) return;
%>
<div class="box-por all">
    <h2 class="title-type"><a href=""><%=ViewPage.CurrentModule.Code=="MProduct" ? "Danh mục Sản phẩm" : _page.Name %></a></h2>
    <ul class="list_dmsp all">

        <%for (int i = 0; listItem != null && i < listItem.Count; i++)
          {
              var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
        %>
        <li><a href="<%=ViewPage.GetPageURL(listItem[i]) %>" <%if (ViewPage.IsPageActived(listItem[i]))
                                                               {%>class="active" <%} %>><%=listItem[i].Name %></a> </li>
        <%} %>
    </ul>
</div>
