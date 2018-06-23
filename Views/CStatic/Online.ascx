<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    char[] countVisit = (Utils.GetCountVisit() + 20453190).ToString().ToCharArray();
    string title = ViewBag.Title;
%>

<div class="lienket">
    <div class="title">
        <p>Thống kê truy cập</p>
    </div>
    <div class="truycap">
        <div style="text-align: center; padding: 5px 0px;">
            <%for (int i = 0; countVisit != null && i < countVisit.Length; i++){%>
            <img alt="<%=countVisit[i] %>a" src="/Content/skins/images/<%=countVisit[i] %>a.gif" />
            <%} %>
        </div>
        <div class="text_yk">
            <img alt="vtoday" src="/Content/skins/images/vtoday.gif" />&nbsp;&nbsp;Trực tuyến: <%=string.Format("{0:#,##0}", (Utils.GetCountOnline() + 1836))%>
        </div>
        <div class="text_yk">
            <img alt="vall" src="/Content/skins/images/vall.gif" />&nbsp;&nbsp;Tất cả: <%=string.Format("{0:#,##0}", (Utils.GetCountVisit() + 20453190))%>
        </div>
    </div>
</div>