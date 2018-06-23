<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (listItem == null || page == null) return;
    string title = ViewBag.Title;
    var count = listItem.Count(); 
%>

<div class="box-bds all">
    <div class="title01 all">
        <h2><a href="<%=ViewPage.GetPageURL(page) %>"><%=title %></a></h2>
    </div>
    <ul class="list_new001 all">
        <%for (int i = 0; listItem != null && i < listItem.Count; i++)
          {
              string hover = string.Empty;
              string content = Data.RemoveAllTag(listItem[i].Content);
              if (!string.IsNullOrEmpty(content)) hover = Data.CutString(content, 50);
              else if (!string.IsNullOrEmpty(listItem[i].Summary)) hover = Data.CutString(listItem[i].Summary, 50);
        %>
        <li>
            <a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>" title="<%=listItem[i].Name %>">
                <img src="<%= Utils.GetResizeFile(listItem[i].File, 2, 240, 124)%>" alt="<%=listItem[i].Name %>"></a>
            <h3><a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code)%>"><%=listItem[i].Name %></a></h3>
            <p class="tintuc_tomtat"><%=hover%></p>
        </li>
        <%} %>
    </ul>
    <div class="clear"></div>
</div>
