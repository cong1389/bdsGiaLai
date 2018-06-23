<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var model = ViewBag.Model as MNewsModel;
%>
<div class="box-bds all">
    <div class="title01 all">
        <h2><a href="<%=ViewPage.GetURL(ViewPage.CurrentPage.Code)%> " title="<%=ViewPage.CurrentPage.Name %>"><%=ViewPage.CurrentPage.Name %> </a></h2>
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
                <img src="<%=Utils.GetResizeFile(listItem[i].File, 2, 120, 120)%>" alt="<%=listItem[i].Name %>"></a> </div>
            <p>
                <a href="<%=url %>">
                    <%=hover %>
                </a>
            </p>
            <span class="time"><%= string.Format("{0:dd/MM/yyyy}", listItem[i].Published) %></span>
        </li>
        <%} %>
    </ul>
    <div class="clear"></div>
    <ul class="phantrang">
         <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
    </ul>
</div>