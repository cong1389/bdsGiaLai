<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    if (listItem == null) return;
%>

<ul class="slide" id="list_news">
    <%for(int i = 0; i < listItem.Count; i++){
        string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
    %>
    <li>
        <a href="<%=url %>" title="<%=listItem[i].Name %>">
            <img src="<%= Utils.GetResizeFile(listItem[i].File, 2, 550, 328)%>" width="550" height="328" alt="<%= listItem[i].Name %>" />
        </a>
        <div class="onslide">
            <a href="<%=url %>" title="<%=listItem[i].Name %>">
                <%= listItem[i].Name %>
            </a>
        </div>
    </li>
    <%} %>

    <li id="pager_slide"></li>
</ul>

<style type="text/css">
    #pager_slide {
        float: left;
        display: block;
        height: 20px;
        position: absolute;
        padding-left: 15px;
        bottom:10px;
        background: none repeat scroll 0 0 #FFFFFF;
        opacity: 0.7;
    }
    #pager_slide a {
      padding: 1px 6px 5px 5px ;
      background: #49A1D7;
      margin-right: 5px;
      color: #fff;
      font-weight: bold;
      border: 1px solid #fff;
    }
    #pager_slide a.selected {
      padding: 1px 6px 5px 5px ;
      background: #D20604;
      margin-right: 5px;
      color:#fff;
      font-weight:bold;
    }
</style>
