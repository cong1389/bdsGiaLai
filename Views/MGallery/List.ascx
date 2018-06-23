<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var listItem = ViewBag.Data as List<SysPageEntity>;
%>

<div class="pri_left fl">
    <div class="left_rieng all min_height">
        <div class="tieude">
            <div class="tieude1"></div>
            <div class="tieude2">
                <h1><a href="<%=ViewPage.GetPageURL(ViewPage.CurrentPage) %>"><%=ViewPage.CurrentPage.Name %></a></h1>
            </div>
        </div>

        <ul class="list_sp all">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
            <li <%if(i % 4 == 0) {%>class="pding"<%} %>>
                <div class="v6ItemCon">
                    <div class="v6ItemImg">
                        <a href="<%= ViewPage.GetPageURL(listItem[i])%>">
                            <img src="<%=Utils.GetResizeFile(listItem[i].File, 2, 214, 140)%>" alt="<%=listItem[i].Name%>" width="214" height="140" />
                        </a>
                    </div>
                    <div class="v6ItemTitle">
                        <a href="<%= ViewPage.GetPageURL(listItem[i])%>" title="<%=listItem[i].Name%>"><%=Data.CutString(listItem[i].Name, 40)%></a>
                    </div>
                    <div class="v6ItemPrice">
                        <p class="views fr">
                            <a href="<%= ViewPage.GetPageURL(listItem[i])%>" class="xem">Xem</a>
                        </p>
                    </div>
                </div>
            </li>
            <%} %>
        </ul>
    </div>
</div>