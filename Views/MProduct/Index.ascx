﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var listItem = ViewBag.Data as List<ModProductEntity>;
    var model = ViewBag.Model as MProductModel;
%>

<div class="tieude0004">
    <p class="fl icon"><img src="/Content/skins/images/icon.png" /></p>
    <h2 class="fl"><a href="<%=ViewPage.GetPageURL(ViewPage.CurrentPage) %>"><%=ViewPage.CurrentPage.Name %></a></h2>
</div>
<div class="left_rieng all">
    <ul class="list_sp all">
        <%for (int i = 0; listItem != null && i < listItem.Count; i++){
            string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
        %>
        <li <%if(i % 4 == 0) {%>class="pding"<%} %>>
            <div class="v6ItemCon">
                <div class="v6ItemImg">
                    <a href="<%=url%>" title="<%=listItem[i].Name%>"><img src="<%=Utils.GetResizeFile(listItem[i].File, 2, 214, 141)%>" alt="<%=listItem[i].Name%>" width="214" height="141" /></a>
                </div>

                <div class="v6ItemPrice">
                    <a href="<%=url%>" title="<%=listItem[i].Name%>"><%=Data.CutString(listItem[i].Name, 40)%></a>
                </div>
            </div>
        </li>
        <%} %>
    </ul>

    <div class="pages0003 fr">
        <ul class="pages-inner none fl">
            <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
        </ul>
    </div>
</div>