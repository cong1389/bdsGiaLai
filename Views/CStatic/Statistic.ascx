<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    int countBSNews = ModBSNewsService.Instance.CreateQuery()
                                .Where(o => o.Activity == true)
                                .Count().ToValue_Cache().ToInt(0);
%>

<div class="topInfo">
    <div class="pageWrap">
        <h6>Thống kê: <b><%=string.Format("{0:#,##0}", countBSNews) %> BĐS</b> đang giao dịch.</h6>
        <p class="hotline002">{RS:Web_Hotline}<span>|</span></p>
        <p class="sangtin"><a href="<%=ViewPage.GetURL("dang-tin") %>" rel="nofollow">Đăng tin</a></p>
    </div>
</div>
