<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var listItem = ViewBag.Data as List<ModGalleryEntity>;
    var model = ViewBag.Model as MGalleryModel;
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
                        <a href="<%= Utils.GetResizeFile(listItem[i].File, 4, 800, 800)%>" class="highslide" onclick="return hs.expand(this)">
                            <img src="<%=Utils.GetResizeFile(listItem[i].File, 2, 214, 140)%>" alt="<%=listItem[i].Name%>" width="214" height="140" />
                        </a>
                    </div>
                    <div class="v6ItemTitle">
                        <a href="<%= Utils.GetResizeFile(listItem[i].File, 4, 800, 800)%>" class="highslide" onclick="return hs.expand(this)" title="<%=listItem[i].Name%>"><%=Data.CutString(listItem[i].Name, 40)%></a>
                    </div>
                    <div class="v6ItemPrice">
                        <p class="views fr">
                            <a href="<%= Utils.GetResizeFile(listItem[i].File, 4, 800, 800)%>" class="xem highslide" onclick="return hs.expand(this)">Xem ảnh lớn</a>
                        </p>
                    </div>
                </div>
            </li>
            <%} %>
        </ul>
        <div class="pages fr">
            <ul class="pages-inner none fl">
                <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
            </ul>
        </div>
    </div>
</div>