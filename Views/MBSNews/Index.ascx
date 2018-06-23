﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    var model = ViewBag.Model as MBSNewsModel;

    string urlPage = "";
    string[] ArrPage = ViewPage.Request.RawUrl.Split('?');
    if (ArrPage != null && ArrPage.Length > 1) urlPage = ArrPage[0];
%>


<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h1 title="<%=ViewPage.CurrentPage.Name %>"><a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.Code)%> " class="a-title" title="<%=ViewPage.CurrentPage.Name %>"><%=ViewPage.CurrentPage.PageTitle %> </a></h1>
            <p class="fr dangvip ico-sty">
                <a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.Code)%>" title="<%=ViewPage.CurrentPage.Name %>">Đăng V.I.P </a>
            </p>
        </div>
    </div>
    <div class="bds-body">
        <div class="list-bds">
            <ul>
                <%for (int i = 0; listItem != null && i < listItem.Count; i++)
                  {
                      string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);

                      string hover = string.Empty;
                      string title = string.Empty;
                      title = listItem[i].Name.ToString();
                      string content = Data.RemoveAllTag(listItem[i].Content);
                      if (!string.IsNullOrEmpty(content)) hover = Data.CutString(content, 250);
                      else if (!string.IsNullOrEmpty(listItem[i].Summary)) hover = Data.CutString(listItem[i].Summary, 250);
                %>
                <li>
                    <a href="<%=url %>" class="avatar">
                        <img src="<%= Utils.GetResizeFile(listItem[i].File, 2, 160, 120)%>" title="<%=title %>" alt="<%=title %>"></a>
                    <div class="wr_info">

                        <h3 class="<%= listItem[i].State == 1 ? "titlehot" : "title" %>" title="<%=title %>">
                            <a href="<%=url %>" title="<%=title %>" class="screenshot" rel="<%= Utils.GetResizeFile(listItem[i].File, 4, 160, 0)%>" rev="<%= hover %>"><%= listItem[i].Name %>
                                <%if (listItem[i].State == 1)
                                  {%>
                                <img border="0" src="/Content/skins/images/imgVip.gif" alt="<%=title %>" title="<%=title %>">
                                <%} %>
                               
                            </a>
                        </h3>
                        <div class="Summary"><%=hover %></div>
                        <div class="meta">
                            <div class="mt2">
                                <div class="price"> <label>Mức giá</label> : <%=listItem[i].DVPriceID != 0 ? listItem[i].PriceView : "Thỏa Thuận" %> <%=listItem[i].DVPriceID != 0 ? listItem[i].getDVPrice().Name : ""%></div>
                                <div class="area"> <label>Diện tích</label> : <%= listItem[i].Square %> m² </div>
                                <div class="address"> <label>Địa điểm</label> : <%=listItem[i].getStreet().Name %> <%= listItem[i].StreetID > 0 ? "-" : ""%> <%=listItem[i].getDistrict().Name %> <%= listItem[i].DistrictID > 0 ? "-" : ""%> <%=listItem[i].getCity().Name %> </div>
                            </div>
                        </div>
                        <p class="wr_view time"><%= string.Format("{0:dd/MM/yyyy}", listItem[i].Created) %> </p>
                    </div>
                </li>
                <%} %>
            </ul>
        </div>

      
    </div>
      <ul class="phantrang">
            <%= GetPagination(urlPage, model.Page, model.PageSize, model.TotalRecord)%>
        </ul>
</div>
