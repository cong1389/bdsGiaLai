<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
%>
<form method="post" name="state_form">

    <ul class="top-right fr">
        <%if (!WebLogin.IsLogin())
          {%>
        <%for (int i = 0; listItem != null && i < listItem.Count; i++)
          {%>
        <li><a href="<%=ViewPage.GetPageURL(listItem[i]) %>" rel="nofollow"><%=listItem[i].Name %> </a></li>
        <%} %>
        <%}
          else
          {%>
        <li><a href="<%=ViewPage.GetURL("thanh-vien") %>" rel="nofollow">Chào bạn <b><%=WebLogin.CurrentUser.Username %></b></a></li>
        <li><a href="<%=ViewPage.GetURL("quan-ly-san-pham")%>?act=quan-ly-san-pham" rel="nofollow">Quản lý sản phẩm</a></li>
        <li><a href="<%=ViewPage.GetURL("quan-ly-don-hang")%>" rel="nofollow">Quản lý dơn hàng</a></li>
        <li><a href="javascript:void(0)" onclick="document.state_form.submit()" rel="nofollow">Thoát</a></li>
        <%}%>
    </ul>
    <input type="hidden" name="_vsw_action[CMenu-Logout-HeaderRight]" />
    <input type="submit" name="_vsw_action[CMenu-Logout-HeaderRight]" style="display: none" />
</form>
