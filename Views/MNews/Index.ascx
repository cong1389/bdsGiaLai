<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var model = ViewBag.Model as MNewsModel;
%>

<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="" class="a-title"><%=ViewPage.CurrentPage.Name %> </a></h2>
        </div>
    </div>
    <div class="bds-body">
        <ul class="list_tintuc">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++)
              {
                  string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
            %>
            <li>
                <a href="<%=url %>">
                    <img src="<%=Utils.GetResizeFile(listItem[i].File, 2, 160, 120)%>" width="160" height="120" alt="<%=listItem[i].Name%>" />
                </a>
                <a href="<%=url %>"><%= listItem[i].Name %></a>
                <p class="name2">
                    <a href="<%=url %>"><%= listItem[i].Summary %></a>
                </p>
                <span class="timeNew"><%=string.Format("{0:dd/MM/yyyy}", listItem[i].Published) %></span>
            </li>
            <%} %>
        </ul>
        <ul class="phantrang">
            <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
        </ul>
    </div>
</div>
