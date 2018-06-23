<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    var model = ViewBag.Model as MSearchModel;
%>
<div class="box-bds all">
    <div class="title01 all">
        <h2><a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.Code)%> " title="<%=ViewPage.CurrentPage.Name %>"><%=ViewPage.CurrentPage.PageTitle %> </a></h2>
    </div>
    <ul class="list-bds">
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
            <h3><a href="<%=url %>"><%=listItem[i].Name %></a>
            </h3>
            <div class="img_bds"><a href="<%=url %>">
                <img src="/Content/Mobile/skins/images/img1.jpg"></a> </div>
            <p>
                <a href="<%=url %>">
                    <%=hover %>
                </a>
            </p>
            <div class="meta">
                <span class="sp-info"><b>Giá:</b> <%=listItem[i].DVPriceID != 0 ? string.Format("{0:#,##0}", listItem[i].Price) : "Thỏa Thuận" %> <%=listItem[i].DVPriceID != 0 ? listItem[i].getDVPrice().Name : ""%> </span>
                <span class="sp-info"><b>Giá:</b> <%= listItem[i].Square %> m² </span>
                <span class="sp-info"><b>Địa điểm :</b>  <%=listItem[i].getStreet().Name %> <%= listItem[i].StreetID > 0 ? "-" : ""%> <%=listItem[i].getDistrict().Name %> <%= listItem[i].DistrictID > 0 ? "-" : ""%> <%=listItem[i].getCity().Name %>  </span>
            </div>
            <span class="time"><%= string.Format("{0:dd/MM/yyyy}", listItem[i].Created) %></span>
        </li>
        <%} %>
    </ul>
    <div class="clear"></div>
    <ul class="phantrang">
        <%= GetPagination("?keyword=" + model.keyword, model.Page, model.PageSize, model.TotalRecord)%>
    </ul>
</div>
