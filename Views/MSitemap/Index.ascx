<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<script runat="server">

    public void GenMap(TreeView tv, int pageID)
    {
        List<SysPageEntity> listPage = SysPageService.Instance.CreateQuery()
            .Where(o => o.ParentID == pageID)
            .OrderByAsc(o => new { o.Order, o.ID })
            .ToList_Cache();

        for (int i = 0; listPage != null && i < listPage.Count; i++)
        {
            TreeNode _tn = new TreeNode(listPage[i].Name);
            _tn.NavigateUrl = ViewPage.GetPageURL(listPage[i]);
            _tn.ImageUrl = "/Content/img/icon_folder.gif";

            tv.Nodes.Add(_tn);

            GenMap(_tn, listPage[i].ID);
        }
    }

    public void GenMap(TreeNode tn, int pageID)
    {
        List<SysPageEntity> listPage = SysPageService.Instance.CreateQuery()
            .Where(o => o.ParentID == pageID)
            .OrderByAsc(o => new { o.Order, o.ID })
            .ToList_Cache();

        for (int i = 0; listPage != null && i < listPage.Count; i++)
        {
            TreeNode _tn = new TreeNode(listPage[i].Name);

            _tn.NavigateUrl = ViewPage.GetPageURL(listPage[i]);
            _tn.ImageUrl = "/Content/img/icon_folder.gif";

            tn.ChildNodes.Add(_tn);

            GenMap(_tn, listPage[i].ID);
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        var PageID = ViewBag.PageID;
        
        GenMap(tvMap, PageID);
    }
</script>

<style type="text/css">
    .sitemap
    {
      padding-left:10px;
      width:10px;
    }
    .sitemap a
    {
        color:#05478A;
    }
    .sitemap a:hover
    {
        color:#f26224;
    }
</style>

<div class="sanpham_c fl">
    <div class="tieude_c"><%=ViewPage.GetBreadcrum()%></div>

    <div class="tintuc_bd" style="width:96%;">
        <div class="detail_tintuc">
            <h3>Sơ đồ website</h3>
            
            <asp:TreeView CssClass="sitemap" ID="tvMap" runat="server" ImageSet="BulletedList4">
                <Nodes></Nodes>
                <NodeStyle Font-Names="Tahoma" Font-Size="12px" ForeColor="#333333" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                <ParentNodeStyle Font-Bold="true" />
                <HoverNodeStyle Font-Underline="True" ForeColor="#FF0000" />
                <SelectedNodeStyle Font-Underline="True" ForeColor="#FF0000" HorizontalPadding="0px" VerticalPadding="0px" />
            </asp:TreeView>
            <p>&nbsp;</p>
        </div>
    </div>
</div>