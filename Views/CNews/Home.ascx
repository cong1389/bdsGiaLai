<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (listItem == null || page == null) return;
    string title = ViewBag.Title;
    var count = listItem.Count(); 
%>
<div class="box-bds all">
      <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="<%=ViewPage.GetPageURL(page) %>" class="a-title"><%=title %>-  <%=count %> Tin BDS </a></h2>
                       <p class="fr dangvip">
                <a href="<%=ViewPage.GetPageURL(page) %>">Xem thêm >> </a>
            </p>
        </div>
    </div>
    <div class="bds-body">
        <ul class="noibat">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++)
              {
                  string hover = string.Empty;
                  string content = Data.RemoveAllTag(listItem[i].Content);
                  if (!string.IsNullOrEmpty(content)) hover = Data.CutString(content, 65);
                  else if (!string.IsNullOrEmpty(listItem[i].Summary)) hover = Data.CutString(listItem[i].Summary, 65);
                  %>
            <li>
                <p class="image"><a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>" title="<%=listItem[i].Name %>">
                    <img src="<%= Utils.GetResizeFile(listItem[i].File, 2, 240, 124)%>" alt="<%=listItem[i].Name %>"></a></p>
                <h2><a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>"><%=listItem[i].Name %></a></h2>
                <p class="meta"><%=hover%></p>
            </li>
            <%} %>
        </ul>
    </div>
</div>
