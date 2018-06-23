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

<div class="products-cat all">
    <h2 class="title-cm bg-<%=ColorID != null  ? Color.Code : "red" %> "><a href="<%=ViewPage.GetPageURL(page) %>"><i class="icon-title">
        <img src="<%=page.Icon%>"></i> <%=page.Name%> </a></h2>
    <div class="bg-product all">
        <div class="floor_menu bd-<%=ColorID != null  ? Color.Code : "red" %> fl">
            <div class="floor_menu_title ">Sản phẩm Vip</div>

            <ul class="floor_menu_list">
                <%for (int i = 0; listChildPage != null && i < (listChildPage.Count > 11 ? 11 : listChildPage.Count); i++)
                  {%>
                <li><a href="<%=ViewPage.GetPageURL(listChildPage[i]) %>"><%=listChildPage[i].Name %></a></li>
                <%}%>
            </ul>
        </div>
        <div class="product-item fr">
            <div class="cate-categories">
                <div class="block-category">
                    <h2 class="title"><a href="" title="">Loại xe</a> <i class="show">&nbsp;</i> </h2>
                    <div class="nav-category">
                        <ul>
                            <li><a href="" title="">Xe con</a></li>
                            <li><a href="" title="">Xe khách</a></li>
                            <li><a href="" title="">Xe tải</a></li>
                            <li><a href="" title="">Xe độ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="block-category">
                    <h2 class="title"><a href="" title="">Địa điểm GD</a> <i class="show">&nbsp;</i> </h2>
                    <div class="nav-category">
                        <ul>
                            <li><a href="" title="">Hà Nội</a></li>
                            <li><a href="" title="">TP HCM</a></li>
                            <li><a href="" title="">Đà Nẵng</a></li>
                            <li><a href="" title="">Thái Bình</a></li>
                        </ul>
                    </div>
                </div>
                <div class="block-category">
                    <h2 class="title"><a href="" title="">Hãng Xe</a> <i class="show">&nbsp;</i> </h2>
                    <div class="nav-category">
                        <ul>
                            <li><a href="" title="">Honda</a></li>
                            <li><a href="" title="">Yamaha</a></li>
                        </ul>
                    </div>
                </div>
                <div class="block-category">
                    <h2 class="title"><a href="" title="">Số km đã đi</a> <i class="show">&nbsp;</i> </h2>
                    <div class="nav-category">
                        <ul>
                            <li><a href="" title="">1000km - 2000km</a></li>
                            <li><a href="" title="">2000km trở lên</a></li>
                        </ul>
                    </div>
                </div>
                <div class="block-category">
                    <h2 class="title"><a href="" title="">Giá thấp nhất</a> <i class="show">&nbsp;</i> </h2>
                </div>
                <div class="block-category">
                    <h2 class="title"><a href="" title="">Giá cao nhất </a><i class="show">&nbsp;</i> </h2>
                </div>
            </div>
            <div class="clearfix"></div>
            <ul class="list-product all">
                <%for (int i = 0; listItem != null && i < listItem.Count; i++)
                  {
                      string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
                %>
                <li>
                    <%=listItem[i].isVip ==1 ? "<p class=\"type-vip\"></p>" : "" %>
                    <%=listItem[i].isVip ==2 ? "<p class=\"type-sieuvip\"></p>" : "" %>
                    <p class="image">
                        <a href="<%=url %>">
                            <img src="<%=Utils.GetResizeFile(listItem[i].File, 4, 165, 165)%>" alt="<%=listItem[i].Name%>" />
                        </a>
                    </p>
                    <h2><a href="<%=url %>" title=""><%=listItem[i].Name %></a></h2>
                    <p class="price-down"><%=string.Format("{0:#,##0}", listItem[i].Price) %> đ</p>
                </li>
                <%} %>
            </ul>
        </div>
    </div>
</div>
