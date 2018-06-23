<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
%>
<div class="nam-topbar">
    <ul class="nam-menu1">
        <%for (int i = 0; listItem != null && i < listItem.Count; i++)
          {
              var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
        %>
        <li <%if (ViewPage.IsPageActived(listItem[i]))
              {%>class="li-activer"
            <%} %>><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %></a>
            <%if (listChildItem != null)
              {%>
            <ul class="menu_cap2">
                <%for (int j = 0; j < listChildItem.Count; j++)
                  {
                      var listChildItemlv2 = SysPageService.Instance.GetByParent_Cache(listChildItem[j].ID);%>
                <li><a <%if (listChildItemlv2 != null)
                         {%>class="indent" <%} %> href="<%=ViewPage.GetPageURL(listChildItem[j]) %>"><%=listChildItem[j].Name %></a>

                    <%if (listChildItemlv2 != null)
                      {%>
                    <ul class="menu_cap3">

                        <%for (int k = 0; k < listChildItemlv2.Count; k++)
                          {%>
                        <li><a href="<%=ViewPage.GetPageURL(listChildItemlv2[k]) %>"><%=listChildItemlv2[k].Name %></a>
                        </li>
                        <%} %>
                    </ul>
                    <%  } %>
                </li>
                <%} %>
            </ul>       
            <%} %>
        </li>
        <%} %>
    </ul>


    <div class="nam-dangtin">

         <%if (!WebLogin.IsLogin()){%>
        <a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.MenuID,"dang-nhap") %>">Đăng nhập</a> | <a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.MenuID,"dang-ky")%>">Đăng ký</a> | <a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.MenuID,"dang-tin")%>">Đăng tin<img alt="Đăng tin rao cặt mua bán nhà đất - Reo.com.vn" src="/Data/upload/images/muten.png" style="width: 16px; height: 16px;" /></a>

         <%}
           else
           {%>
                <a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.MenuID,"tai-khoan") %>"> Chào: <%=WebLogin.CurrentUser.Username %><img alt="Thông tin tài khoản - Reo.com.vn" src="/Content/skins/images/dang-nhap.png" style="width: 16px; height: 16px;" /></a> | <a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.MenuID,"dang-tin")%>">Đăng tin<img alt="Đăng tin rao cặt mua bán nhà đất - Reo.com.vn" src="/Data/upload/images/muten.png" style="width: 16px; height: 16px;" /></a>
          <% } %>

    </div>
</div>
<div class="clearfix"></div>


