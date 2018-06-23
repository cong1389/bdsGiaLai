<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModProductEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (page == null) return;
    string title = ViewBag.Title;
    int ColorID = ViewBag.ColorID;
    int isVip = ViewBag.isVip;
    var listChildPage = SysPageService.Instance.GetByParent_Cache(page.ID);
    var Color = WebMenuService.Instance.GetByID(ColorID);
%>

<div class="box-spsieuvip mg-top10 fl">
    <h2 class="title-cm bg-<%=ColorID != null  ? Color.Code : "red" %> "><a href="<%=ViewPage.GetPageURL(page) %>"><i class="icon-title">
        <img src="<%=page.Icon%>"></i> <%=page.Name%> </a></h2>
    <div class="home-sp-sieuvip fl">
        <ul class="list-product sp" id="list-hot">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++)
              {
                  string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
            %>
            <li>
                  <%=listItem[i].isVip ==1 ? "<p class=\"type-vip\"></p>" : "" %>
            <%=listItem[i].isVip ==2 ? "<p class=\"type-sieuvip\"></p>" : "" %>
                <p class="image">
                    <a href="<%=url %>" title="<%= listItem[i].Name %>">
                        <img src="<%=Utils.GetResizeFile(listItem[i].File, 4, 165, 165)%>" alt="<%=listItem[i].Name%>" />
                    </a>
                </p>
                <h2><a href="<%=url %>" title="<%= listItem[i].Name %>"><%=listItem[i].Name%></a></h2>
                <p class="price-down"><%=string.Format("{0:#,##0}", listItem[i].Price) %> đ</p>
            </li>
            <%} %>
        </ul>
        <p class="bg_icon003 next" id="hot-prev"><a href="javascript:void(0)" rel="nofollow">Previous</a></p>
        <p class="bg_icon003 pre" id="hot-next"><a href="javascript:void(0)" rel="nofollow">Next</a></p>
    </div>
</div>
