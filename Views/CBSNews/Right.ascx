<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (listItem == null || page == null) return;
    string title = ViewBag.Title;
    string link = ViewBag.Link;
    int isVip = ViewBag.isVip;
    
%>
<div class="box-tin all">
                    <div class="title-1">
                        <div class="dv-ico-1"><i class="ico-sty icon-nhadat"></i></div>
                        <div class="dv-ct-tabs-1"> <a href="<%=ViewPage.GetPageURL(page) %>" class="a-title" title="<%=page.Name %>"><%=title %></a> </div>
                    </div>
                    <div class="list-dmtt">
                        <ul class="list_tieubieu">
                             <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
        <li><span><img src="/Content/skins/images/hot.gif" alt=" <%=listItem[i].Name %>" /> </span><a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>" title="<%=listItem[i].Name %>"> <%=listItem[i].Name %></a></li>
        <%} %>
                        </ul>
                    </div>
                </div>