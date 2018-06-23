<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
%>
<div class="nav-btn-show fl">
    <a class="menu-icon-wrap" id="TM_MenuView"><i class="menu_icon"></i></a>
    <script>
        $(function () {
            $('#TM_MenuView').click(function () {
                $('#TM_pnMenu').slideToggle('slow');
                $('#Search').slideToggle('slow');
            });
        });
    </script>
<%--    <div class="nav-toggle" id="TM_pnMenu" style="display: none;">
        <ul class="lv1">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++)
              {
            %>
            <li class="lv1-i"><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %></a>
                <%} %>
        </ul>
    </div>--%>
</div>
